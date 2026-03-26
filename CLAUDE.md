# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

AppStoreDevApi 是一个 Ruby gem，提供与 Apple App Store Connect API 交互的客户端库。

**官方 API 文档**: https://developer.apple.com/documentation/appstoreconnectapi
**当前 API 版本支持**: v1, v2 (需要升级到 v4.0)

## 系统架构详解

### 整体架构设计

```
┌─────────────────────────────────────────┐
│         lib/config/schema.json          │  ← 配置层：301个端点定义
└────────────┬────────────────────────────┘
             │ 读取
┌────────────▼────────────────────────────┐
│      lib/app_store_dev_api/schema.rb    │  ← 解析层：JSON→Ruby对象
└────────────┬────────────────────────────┘
             │ 注册
┌────────────▼────────────────────────────┐
│    lib/app_store_dev_api/base.rb        │  ← 核心层：动态方法调度
│    - method_missing                      │
│    - JWT 认证 (Authorization)            │
│    - 端点注册 (Registry)                 │
└────────────┬────────────────────────────┘
             │ 调用
┌────────────▼────────────────────────────┐
│    lib/app_store_dev_api/requests/      │  ← 请求层：数据结构定义
│    - v1/ (主要版本)                      │
│    - v2/ (部分功能)                      │
└─────────────────────────────────────────┘
```

### 核心特性：配置驱动的 API 管理

#### 1. JSON 配置文件 (`lib/config/schema.json`)

**当前规模**：
- 文件大小：1,675 行
- 端点数量：301 个
- 支持版本：v1, v2

**配置结构**：
```json
{
  "web_service_endpoints": [
    {
      "alias": "create_bundle_id",           // Ruby 方法名
      "http_method": "post",                 // HTTP 方法
      "url": "https://api.appstoreconnect.apple.com/v1/bundleIds",
      "http_body_type": "Requests::V1::BundleId::Create"  // 请求体类（可选）
    }
  ]
}
```

#### 2. 动态方法生成机制

**工作流程**：
1. **启动时**：Schema 类读取 JSON 文件，创建 WebServiceEndpoint 对象
2. **运行时**：Base 类通过 `method_missing` 拦截方法调用
3. **执行时**：从 Registry 查找端点配置，构建并执行 HTTP 请求

**关键优势**：
- ✅ 无需手动编写 301 个方法
- ✅ 统一的错误处理和响应解析
- ✅ 易于批量更新和维护

#### 3. 请求体管理 (`lib/app_store_dev_api/requests/`)

**目录结构**：
```
requests/
├── v1/                    # API v1 请求类（83个文件）
│   ├── app/
│   │   ├── create.rb
│   │   └── update.rb
│   ├── bundle_id/
│   ├── certificate/
│   └── ...
└── v2/                    # API v2 请求类（新功能）
    ├── sandbox_tester/
    └── in_app_purchase/
```

**请求类设计模式**：
```ruby
module Requests::V1::BundleId
  class Create < Request::Body
    data do
      type 'bundleIds'
      attributes do
        property :identifier, required: true
        property :name, required: true
        property :platform, required: true
      end
    end
  end
end
```

### 认证与安全

#### JWT Token 生成 (`Client::Authorization`)
- 使用 ES256 算法签名
- Token 有效期：20 分钟
- 自动刷新机制

#### 请求头配置
```ruby
{
  'Authorization' => "Bearer #{jwt_token}",
  'Content-Type' => 'application/json'
}
```

### 如何添加新的 API 接口

#### 方式一：添加简单端点（仅 GET/DELETE）
1. 编辑 `lib/config/schema.json`
2. 添加端点配置：
```json
{
  "alias": "get_app_info",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/apps/{id}"
}
```
3. 无需其他操作，立即可用

#### 方式二：添加复杂端点（需要请求体）
1. 在 `schema.json` 中添加端点，指定 `http_body_type`
2. 创建对应的 Request 类：
```ruby
# lib/app_store_dev_api/requests/v1/webhook/create.rb
module Requests::V1::Webhook
  class Create < Request::Body
    data do
      type 'webhooks'
      attributes do
        property :url, required: true
        property :events, required: true
      end
    end
  end
end
```

### 当前问题与升级需求

#### API 版本滞后
- **当前支持**：主要是 API v1.x - v2.x
- **最新版本**：Apple 已发布 API v4.0
- **缺失功能**：
  - Webhooks（事件通知）
  - Accessibility Declarations（无障碍声明）
  - Customer Review Summarizations（评论摘要）
  - Background Assets（后台资源）
  - TestFlight Feedback（Beta 反馈）

#### 需要更新的端点数量
- 新增端点：约 25-30 个
- 更新端点：约 10-15 个
- 废弃端点：约 5 个

### API 文档映射

生成的每个方法都包含对应的 Apple 官方文档链接，例如：
- Bundle ID 注册: https://developer.apple.com/documentation/appstoreconnectapi/register_a_new_bundle_id
- 其他 API: https://developer.apple.com/documentation/appstoreconnectapi

## Key Architecture

### Core Components

1. **Client System** (`lib/app_store_dev_api/client.rb`, `lib/app_store_dev_api/base.rb`)
   - `Base` class handles HTTP requests, JWT authorization, and response decoding
   - `Client` class contains generated methods for each API endpoint
   - Uses `Client::Authorization` for JWT token generation
   - Uses `Client::Registry` for endpoint management

2. **Request Objects** (`lib/app_store_dev_api/requests/`)
   - Organized by API version (v1, v2)
   - Each request type has its own class with data structure definitions
   - Uses builder pattern for request creation

3. **Schema System** (`lib/app_store_dev_api/schema.rb`)
   - Defines API endpoints and their configurations
   - Used for code generation and runtime request handling

4. **Object Model** (`lib/app_store_dev_api/object/`)
   - Provides base classes for API data objects
   - Handles attributes, relationships, and data type definitions

## Development Commands

```bash
# Install dependencies
bundle install

# Open interactive console with the gem loaded
bin/console

# Build the gem
bundle exec rake build

# Install gem locally
bundle exec rake install

# Release new version (creates git tag and pushes to RubyGems)
bundle exec rake release

# Run linter (RuboCop)
bundle exec rubocop

# Generate changelog
bundle exec rake changelog

# 重新生成 Client 类（添加新 API 后）
ruby -r ./lib/app_store_dev_api/client/builder.rb -e "AppStoreDevApi::Client::Builder.new.write"
```

## Version Management

- Version is defined in `lib/app_store_dev_api/version.rb`
- To release: update VERSION constant, then run `bundle exec rake release`

## Code Generation

This project uses generated code (see "WARNING ABOUT GENERATED CODE" comments). The `Client` class and request classes are generated based on Apple's API documentation.

## Dependencies

- **zeitwerk**: Autoloading
- **activesupport**: Ruby extensions
- **jwt**: JWT token generation for Apple API authentication

## API 参考资源

- **官方文档主页**: https://developer.apple.com/documentation/appstoreconnectapi
- **REST API 规范**: 遵循 JSON API 规范
- **认证方式**: JWT Bearer Token
- **基础 URL**: https://api.appstoreconnect.apple.com

## Network Request Rules

### Proxy Configuration
- Claude-related requests: Use environment proxy settings
- Non-Claude requests (e.g., Apple API calls): Direct connection without proxy
  - Use `--noproxy "*"` for curl
  - Use `proxies={'http': None, 'https': None}` for Python requests