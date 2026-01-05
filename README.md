# App Store Connect API Ruby SDK

一个用于与 Apple App Store Connect API 交互的 Ruby 客户端库。

[![API Version](https://img.shields.io/badge/App%20Store%20Connect%20API-v4.2-blue)](https://developer.apple.com/documentation/appstoreconnectapi)
[![Ruby](https://img.shields.io/badge/Ruby-2.7+-red)](https://www.ruby-lang.org)

## 简介

AppStoreDevApi 是一个功能完整的 Ruby gem，提供了对 Apple App Store Connect API 的便捷访问。该库基于官方 API 文档自动生成代码，确保 API 覆盖的完整性和准确性。

**🎉 最新更新**：已完全兼容 Apple App Store Connect API v4.2 规范，所有 241 个接口已验证通过（100% 一致性）。

## 主要特性

- 🔐 **JWT 认证** - 自动处理 JWT token 生成和认证
- 🚀 **自动代码生成** - 基于官方 API 规范自动生成客户端代码
- 📦 **完整 API 覆盖** - 完整支持 App Store Connect API v4.2（v1/v2 API）
- 🛠️ **简单易用** - 提供直观的 Ruby 接口调用 API
- ✅ **完全验证** - 所有 Request 类已通过 OpenAPI 规范验证

## 🚀 最近更新

### API v4.2 完全兼容 (2026-01)

我们对整个库进行了全面升级，以完全兼容 Apple App Store Connect API v4.2：

**核心改进：**
- ✅ **68 个接口修复** - 修复所有不一致问题，一致性从 72.2% 提升到 100%
- ✅ **160+ 新增接口** - 新增大量 API v4.2 功能支持
- ✅ **命名规范化** - 统一使用驼峰命名（camelCase）
- ✅ **Bug 修复** - 修复核心对象类中的布尔值验证问题
- ✅ **完整测试** - 所有 241 个接口通过验证

**新增功能模块：**
- 🆕 Accessibility Declarations（无障碍声明）
- 🆕 Webhooks（事件通知）
- 🆕 Marketplace Search（市场搜索）
- 🆕 Alternative Distribution（替代分发）
- 🆕 Background Assets（后台资源）
- 🆕 Win Back Offers（用户召回优惠）

**详细更新日志请查看** [CHANGELOG.md](CHANGELOG.md)

## 支持的 API 模块

### ✅ 应用管理
- Apps 基础信息管理
- App Store Versions 版本管理
- App Store Version Submissions 提交审核
- App Store Review Details 审核详情
- Build 构建管理

### ✅ 媒体资源
- App Screenshots 应用截图
- App Previews 应用预览
- App Event Video Clips 活动视频

### ✅ 元数据管理
- App Info & Localizations 应用信息本地化
- App Store Version Localizations 版本本地化
- App Categories 应用分类
- Age Rating Declarations 年龄分级

### ✅ 测试与分发
- TestFlight Beta Testing 测试版管理
- Beta Testers 测试人员管理
- Beta Groups 测试组管理
- Pre-Release Versions 预发布版本

### ✅ 内购与订阅
- In-App Purchases 应用内购买
- Subscriptions 订阅管理
- Promotional Offers 促销优惠

### ✅ 证书与配置
- Bundle IDs 包标识符
- Certificates 证书管理
- Profiles 配置文件
- Devices 设备管理

### ✅ 用户与权限
- Users 用户管理
- User Invitations 用户邀请
- User Roles 角色权限

### ✅ 报告与分析
- Sales Reports 销售报告
- Finance Reports 财务报告
- Power and Performance Metrics 性能指标

## 安装

添加到你的 Gemfile：

```ruby
gem 'app_store_dev_api'
```

然后执行：

```bash
bundle install
```

或者直接安装：

```bash
gem install app_store_dev_api
```

## 快速开始

### 1. 配置认证

```ruby
require 'app_store_dev_api'

client = AppStoreDevApi::Client.new(
  key_id: 'YOUR_KEY_ID',
  issuer_id: 'YOUR_ISSUER_ID',
  private_key: File.read('path/to/AuthKey_YOUR_KEY_ID.p8')
)
```

### 2. 使用示例

```ruby
# 获取所有应用
apps = client.apps

# 获取特定应用信息
app = client.app(id: 'APP_ID')

# 创建新版本
version = client.create_app_store_version(
  attributes: {
    platform: 'IOS',
    versionString: '1.0.1'
  },
  relationships: {
    app: { data: { type: 'apps', id: 'APP_ID' } }
  }
)

# 上传截图
screenshot = client.create_app_screenshot(
  attributes: {
    fileName: 'screenshot.png',
    fileSize: 102400
  },
  relationships: {
    appScreenshotSet: { data: { type: 'appScreenshotSets', id: 'SET_ID' } }
  }
)
```

## 获取 API 密钥

1. 登录 [App Store Connect](https://appstoreconnect.apple.com)
2. 前往「用户和访问」
3. 选择「密钥」标签
4. 点击「生成 API 密钥」或「+」按钮
5. 输入密钥名称并选择访问权限
6. 下载 .p8 私钥文件（只能下载一次）
7. 记录密钥 ID 和发行者 ID

## 系统要求

- Ruby 2.7 或更高版本
- 有效的 App Store Connect 账号
- API 访问权限

## 项目结构

```
lib/
├── app_store_dev_api/
│   ├── client.rb           # 主客户端类（自动生成）
│   ├── base.rb             # 基础请求处理
│   ├── client/
│   │   ├── authorization.rb # JWT 认证实现
│   │   └── builder.rb      # 代码生成器
│   ├── requests/           # API 请求定义
│   │   ├── v1/            # v1 API 请求
│   │   └── v2/            # v2 API 请求
│   └── object/            # 数据模型定义
└── config/
    └── schema.json        # API 端点配置
```

## 开发

本项目使用自动代码生成系统，基于 `schema.json` 配置文件生成 API 客户端方法。

### 重新生成客户端代码

```bash
ruby -r ./lib/app_store_dev_api/client/builder.rb -e "AppStoreDevApi::Client::Builder.new.write"
```

### 运行测试

```bash
bundle exec rspec
```

### 代码检查

```bash
bundle exec rubocop
```

## 贡献

欢迎提交 Issue 和 Pull Request！

## 许可证

MIT License

## 相关链接

- [官方 API 文档](https://developer.apple.com/documentation/appstoreconnectapi)
- [App Store Connect](https://appstoreconnect.apple.com)
- [GitHub 仓库](https://github.com/wade0317/app_store_dev_api)
- [Gitee 镜像](https://gitee.com/goodtools/AppStoreApi-Ruby)

---

⚡ 由 Ruby 驱动 | 基于 App Store Connect API 构建
