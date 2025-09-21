# App Store Connect API 4.0 升级分析报告

## 当前实现架构分析

### 1. 代码生成系统 (Code Generation)

**现有实现特点：**
- 使用 `Client::Builder` 类通过 ERB 模板自动生成 API 客户端方法
- 所有 API 端点定义在 `web_service_endpoints` 数组中
- 生成的代码保存在 `lib/app_store_dev_api/client.rb`
- 支持 HTTP 方法：GET、POST、PATCH、DELETE

**核心组件：**
```ruby
# 端点定义结构
{
  "alias": 'method_name',           # Ruby 方法名
  "http_method": 'post',            # HTTP 方法
  "url": 'https://...',             # API URL
  "http_body_type": 'Requests::V1::...', # 请求体类型
  "see": 'documentation_url'        # 文档链接
}
```

### 2. 请求处理架构

**Base 类核心功能：**
- JWT 认证 (`Client::Authorization`)
- 端点注册 (`Client::Registry`)
- 动态方法调用 (`method_missing`)
- URL 参数替换（使用 `{id}` 占位符）
- 请求/响应编解码

**请求流程：**
1. 构建 URI（替换 URL 中的占位符）
2. 创建请求体（如果需要）
3. 添加认证头部
4. 执行 HTTP 请求
5. 解码响应

### 3. 请求类体系

**现有结构：**
```
lib/app_store_dev_api/requests/
├── v1/
│   ├── app/
│   ├── bundle_id/
│   ├── certificate/
│   ├── subscription/
│   └── ...
└── v2/
    ├── sandbox_tester/
    └── in_app_purchase/
```

## API 4.0 新特性与当前代码差距

### 🆕 需要添加的新功能

#### 1. **Webhooks 支持**
```ruby
# 需要添加的端点
- POST /v1/webhooks
- GET /v1/webhooks
- PATCH /v1/webhooks/{id}
- DELETE /v1/webhooks/{id}

# 需要创建的请求类
- Requests::V1::Webhook::Create
- Requests::V1::Webhook::Update
```

#### 2. **Accessibility Declarations（无障碍声明）**
```ruby
# 需要添加的端点
- POST /v1/accessibilityDeclarations
- GET /v1/accessibilityDeclarations
- PATCH /v1/accessibilityDeclarations/{id}

# App 更新需要支持 accessibilityURL
- PATCH /v1/apps/{id} (更新 accessibilityURL 属性)
```

#### 3. **TestFlight Feedback**
```ruby
# Beta 反馈崩溃提交
- GET /v1/betaFeedbackCrashSubmissions
- GET /v1/betaFeedbackCrashSubmissions/{id}

# Beta 反馈截图提交
- GET /v1/betaFeedbackScreenshotSubmissions
- GET /v1/betaFeedbackScreenshotSubmissions/{id}
```

#### 4. **Customer Review Summarizations（客户评论摘要）**
```ruby
# 新端点
- GET /v1/apps/{id}/customerReviewSummarizations
```

#### 5. **Background Assets（后台资源）**
```ruby
# 需要添加的端点
- POST /v1/backgroundAssets
- GET /v1/backgroundAssets
- PATCH /v1/backgroundAssets/{id}
- DELETE /v1/backgroundAssets/{id}

# 相关的版本管理
- POST /v1/backgroundAssetVersions
- GET /v1/backgroundAssetVersions
```

#### 6. **Game Center 新功能**
```ruby
# Game Center Activities
- POST /v1/gameCenterActivities
- GET /v1/gameCenterActivities
- PATCH /v1/gameCenterActivities/{id}

# Game Center Challenges
- POST /v1/gameCenterChallenges
- GET /v1/gameCenterChallenges
- PATCH /v1/gameCenterChallenges/{id}
```

### ⚠️ 需要更新的现有功能

#### 1. **App 属性更新**
```ruby
# Requests::V1::App::Update 需要添加：
- accessibilityURL          # 新增
- streamlinedPurchasingEnabled  # 默认值 true
```

#### 2. **Device 枚举更新**
```ruby
# 添加新设备类型
- APPLE_VISION_PRO
```

#### 3. **性能指标增强**
```ruby
# XcodeMetrics 新增
- recommendedMetricGoal 字段
```

#### 4. **App Clip 增强**
```ruby
# AppClipAdvancedExperience 新增 mapAction 枚举值
```

### 🗑️ 需要移除的废弃功能

#### 1. **移除的端点**
```ruby
# 删除 App Store version submission 相关
- 移除 create_app_store_version_submission 方法
- 使用 create_review_submission 替代
```

#### 2. **废弃的属性**
```ruby
# AgeRatingDeclaration
- 移除 gamblingAndContests 属性
- 移除 seventeenPlus 属性
- 使用 contests 和 gambling 替代

# GameCenterDetail
- 废弃 challengeEnabled 属性
- 使用 challenges 替代
```

## 建议的更新步骤

### 第一阶段：添加新功能
1. **更新 Builder 类**
   - 添加所有新的 API 端点定义
   - 更新文档链接到 4.0 版本

2. **创建新的请求类**
   - Webhook 相关请求类
   - Accessibility 相关请求类
   - Background Assets 请求类
   - Game Center 新功能请求类

3. **测试新端点**
   - 编写单元测试
   - 集成测试验证

### 第二阶段：更新现有功能
1. **更新现有请求类**
   - App::Update 添加新属性
   - Device 添加新枚举值
   - 性能指标添加新字段

2. **处理废弃警告**
   - 为废弃的方法添加 deprecation 警告
   - 提供迁移指南

### 第三阶段：清理和优化
1. **移除废弃代码**
   - 删除已移除的端点
   - 清理过时的请求类

2. **文档更新**
   - 更新 README
   - 添加 4.0 迁移指南
   - 更新示例代码

## 代码示例

### 添加 Webhook 端点
```ruby
# 在 Client::Builder#web_service_endpoints 中添加
{
  "alias": 'create_webhook',
  "http_method": 'post',
  "url": 'https://api.appstoreconnect.apple.com/v1/webhooks',
  "http_body_type": 'Requests::V1::Webhook::Create',
  "see": 'https://developer.apple.com/documentation/appstoreconnectapi/webhook-notifications'
},
{
  "alias": 'list_webhooks',
  "http_method": 'get',
  "url": 'https://api.appstoreconnect.apple.com/v1/webhooks',
  "see": 'https://developer.apple.com/documentation/appstoreconnectapi/webhook-notifications'
},
{
  "alias": 'update_webhook',
  "http_method": 'patch',
  "url": 'https://api.appstoreconnect.apple.com/v1/webhooks/{id}',
  "http_body_type": 'Requests::V1::Webhook::Update',
  "see": 'https://developer.apple.com/documentation/appstoreconnectapi/webhook-notifications'
}
```

### 创建 Webhook 请求类
```ruby
# lib/app_store_dev_api/requests/v1/webhook/create.rb
module AppStoreDevApi
  module Requests
    module V1
      module Webhook
        class Create < Request::Body
          data do
            type 'webhooks'
            attributes do
              property :name, required: true
              property :url, required: true
              property :events, required: true
              property :enabled, default: true
            end
          end
        end
      end
    end
  end
end
```

## 优先级建议

### 高优先级
1. **Webhooks** - 关键的新功能，支持事件通知
2. **Customer Review Summarizations** - 增强用户反馈分析
3. **TestFlight Feedback** - 改善 Beta 测试体验

### 中优先级
1. **Accessibility Declarations** - 合规性相关
2. **Background Assets** - 资源管理优化
3. **属性更新** - 保持 API 兼容性

### 低优先级
1. **Game Center 新功能** - 特定游戏功能
2. **废弃功能清理** - 可以逐步进行

## 总结

当前的代码架构设计良好，支持通过代码生成快速添加新端点。主要工作集中在：

1. **在 Builder 类中添加新端点定义**（约 30+ 个新端点）
2. **创建对应的请求类**（约 15+ 个新类）
3. **更新现有请求类的属性**（5-10 个类需要更新）
4. **添加废弃警告和迁移指南**

建议按照优先级分阶段实施更新，确保向后兼容性，并为用户提供清晰的迁移路径。