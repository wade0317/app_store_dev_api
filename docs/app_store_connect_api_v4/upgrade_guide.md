# App Store Connect API 4.0 升级指南

## 当前实现架构（纠正版）

### 配置驱动的代码生成系统

当前项目使用 **JSON 配置文件** 来管理所有 API 端点：

```
lib/config/schema.json  # 核心配置文件（1675行，301个端点）
    ↓
Schema 类解析
    ↓
Client::Registry 注册
    ↓
Base 类动态调用
```

### 关键文件说明

1. **`lib/config/schema.json`** - 端点配置文件
   - 包含 301 个 API 端点定义
   - 定义格式：
   ```json
   {
     "alias": "method_name",        // Ruby 方法名
     "http_method": "post",         // HTTP 方法
     "url": "https://...",          // API URL
     "http_body_type": "Requests::V1::..." // 请求体类型（可选）
   }
   ```

2. **`lib/app_store_dev_api/schema.rb`** - Schema 解析器
   - 读取 JSON 文件
   - 创建 WebServiceEndpoint 对象
   - 注册到 Registry

3. **`lib/app_store_dev_api/base.rb`** - 核心执行逻辑
   - 通过 `method_missing` 动态处理方法调用
   - 从 Registry 查找端点配置
   - 执行 HTTP 请求

## API 4.0 更新方案

### 步骤一：更新 schema.json 文件

需要在 `lib/config/schema.json` 的 `web_service_endpoints` 数组中添加新端点：

#### 1. Webhooks 端点
```json
{
  "alias": "create_webhook",
  "http_method": "post",
  "url": "https://api.appstoreconnect.apple.com/v1/webhooks",
  "http_body_type": "Requests::V1::Webhook::Create"
},
{
  "alias": "list_webhooks",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/webhooks"
},
{
  "alias": "get_webhook",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/webhooks/{id}"
},
{
  "alias": "update_webhook",
  "http_method": "patch",
  "url": "https://api.appstoreconnect.apple.com/v1/webhooks/{id}",
  "http_body_type": "Requests::V1::Webhook::Update"
},
{
  "alias": "delete_webhook",
  "http_method": "delete",
  "url": "https://api.appstoreconnect.apple.com/v1/webhooks/{id}"
}
```

#### 2. Accessibility Declarations 端点
```json
{
  "alias": "create_accessibility_declaration",
  "http_method": "post",
  "url": "https://api.appstoreconnect.apple.com/v1/accessibilityDeclarations",
  "http_body_type": "Requests::V1::AccessibilityDeclaration::Create"
},
{
  "alias": "list_accessibility_declarations",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/accessibilityDeclarations"
},
{
  "alias": "get_accessibility_declaration",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/accessibilityDeclarations/{id}"
},
{
  "alias": "update_accessibility_declaration",
  "http_method": "patch",
  "url": "https://api.appstoreconnect.apple.com/v1/accessibilityDeclarations/{id}",
  "http_body_type": "Requests::V1::AccessibilityDeclaration::Update"
}
```

#### 3. TestFlight Feedback 端点
```json
{
  "alias": "list_beta_feedback_crash_submissions",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/betaFeedbackCrashSubmissions"
},
{
  "alias": "get_beta_feedback_crash_submission",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/betaFeedbackCrashSubmissions/{id}"
},
{
  "alias": "list_beta_feedback_screenshot_submissions",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/betaFeedbackScreenshotSubmissions"
},
{
  "alias": "get_beta_feedback_screenshot_submission",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/betaFeedbackScreenshotSubmissions/{id}"
}
```

#### 4. Customer Review Summarizations 端点
```json
{
  "alias": "get_customer_review_summarizations",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/apps/{id}/customerReviewSummarizations"
}
```

#### 5. Background Assets 端点
```json
{
  "alias": "create_background_asset",
  "http_method": "post",
  "url": "https://api.appstoreconnect.apple.com/v1/backgroundAssets",
  "http_body_type": "Requests::V1::BackgroundAsset::Create"
},
{
  "alias": "list_background_assets",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/backgroundAssets"
},
{
  "alias": "get_background_asset",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/backgroundAssets/{id}"
},
{
  "alias": "update_background_asset",
  "http_method": "patch",
  "url": "https://api.appstoreconnect.apple.com/v1/backgroundAssets/{id}",
  "http_body_type": "Requests::V1::BackgroundAsset::Update"
},
{
  "alias": "delete_background_asset",
  "http_method": "delete",
  "url": "https://api.appstoreconnect.apple.com/v1/backgroundAssets/{id}"
}
```

#### 6. Game Center 新端点
```json
{
  "alias": "create_game_center_activity",
  "http_method": "post",
  "url": "https://api.appstoreconnect.apple.com/v1/gameCenterActivities",
  "http_body_type": "Requests::V1::GameCenterActivity::Create"
},
{
  "alias": "list_game_center_activities",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/gameCenterActivities"
},
{
  "alias": "create_game_center_challenge",
  "http_method": "post",
  "url": "https://api.appstoreconnect.apple.com/v1/gameCenterChallenges",
  "http_body_type": "Requests::V1::GameCenterChallenge::Create"
},
{
  "alias": "list_game_center_challenges",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/gameCenterChallenges"
}
```

### 步骤二：创建请求类

为每个需要请求体的端点创建对应的 Request 类：

#### Webhook 请求类
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
              property :events, required: true  # Array of event types
              property :enabled, default: true
            end
          end
        end
      end
    end
  end
end

# lib/app_store_dev_api/requests/v1/webhook/update.rb
module AppStoreDevApi
  module Requests
    module V1
      module Webhook
        class Update < Request::Body
          data do
            id
            type 'webhooks'
            attributes do
              property :name
              property :url
              property :events
              property :enabled
            end
          end
        end
      end
    end
  end
end
```

#### AccessibilityDeclaration 请求类
```ruby
# lib/app_store_dev_api/requests/v1/accessibility_declaration/create.rb
module AppStoreDevApi
  module Requests
    module V1
      module AccessibilityDeclaration
        class Create < Request::Body
          data do
            type 'accessibilityDeclarations'
            attributes do
              property :deviceFamily, required: true
              property :hasMotion
              property :hasFlashingLights
              property :hasStrobingLights
              property :hasSoundEffects
              property :hasBackgroundAudio
              property :isMadeForKids
            end
            relationships do
              property :app, required: true
            end
          end
        end
      end
    end
  end
end
```

### 步骤三：更新现有请求类

#### 更新 App::Update 类
```ruby
# lib/app_store_dev_api/requests/v1/app/update.rb
module AppStoreDevApi
  module Requests
    module V1
      module App
        class Update < Request::Body
          data do
            id
            type 'apps'
            attributes do
              # 现有属性...
              property :accessibilityURL  # 新增
              property :streamlinedPurchasingEnabled, default: true  # 新增默认值
            end
          end
        end
      end
    end
  end
end
```

### 步骤四：处理废弃的端点

在 schema.json 中移除或标记废弃的端点：

```json
// 移除 App Store version submission 相关端点
// 不再包含以下端点：
// {
//   "alias": "create_app_store_version_submission",
//   ...
// }
```

### 步骤五：添加枚举值更新

更新设备类型定义（如果有枚举定义文件）：

```ruby
# 添加 Apple Vision Pro 设备类型
module AppStoreDevApi
  module Enums
    module DeviceType
      # 现有设备类型...
      APPLE_VISION_PRO = 'APPLE_VISION_PRO'
    end
  end
end
```

## 实施清单

### 1. 备份当前配置
```bash
cp lib/config/schema.json lib/config/schema.json.backup
```

### 2. 更新 schema.json
- [ ] 添加 Webhooks 端点（5个）
- [ ] 添加 Accessibility Declarations 端点（4个）
- [ ] 添加 TestFlight Feedback 端点（4个）
- [ ] 添加 Customer Review Summarizations 端点（1个）
- [ ] 添加 Background Assets 端点（5个+）
- [ ] 添加 Game Center 新端点（4个+）
- [ ] 移除废弃的端点

### 3. 创建请求类
- [ ] Webhook::Create
- [ ] Webhook::Update
- [ ] AccessibilityDeclaration::Create
- [ ] AccessibilityDeclaration::Update
- [ ] BackgroundAsset::Create
- [ ] BackgroundAsset::Update
- [ ] GameCenterActivity::Create
- [ ] GameCenterChallenge::Create

### 4. 更新现有类
- [ ] App::Update（添加新属性）
- [ ] AgeRatingDeclaration（移除废弃属性）
- [ ] GameCenterDetail（更新属性）

### 5. 测试验证
- [ ] 单元测试新端点
- [ ] 集成测试
- [ ] 向后兼容性测试

## 版本管理建议

1. **当前版本**：保持 0.1.9
2. **过渡版本**：0.2.0（添加 4.0 新功能，保留废弃功能）
3. **正式版本**：0.3.0（移除废弃功能）

## 使用示例

更新后的使用方式：

```ruby
# 初始化客户端
client = AppStoreDevApi::Client.new(
  issuer_id: 'YOUR_ISSUER_ID',
  key_id: 'YOUR_KEY_ID',
  private_key: 'YOUR_PRIVATE_KEY'
)

# 使用新的 Webhook API
webhook = client.create_webhook(
  name: 'My Webhook',
  url: 'https://example.com/webhook',
  events: ['APP_STORE_VERSION_STATE_CHANGED', 'BUILD_STATE_CHANGED']
)

# 获取客户评论摘要
summarizations = client.get_customer_review_summarizations(
  id: 'app_id'
)

# 管理无障碍声明
declaration = client.create_accessibility_declaration(
  app_id: 'app_id',
  deviceFamily: 'IPHONE',
  hasMotion: false,
  hasFlashingLights: false
)
```

## 总结

由于项目使用 JSON 配置文件管理端点，更新过程相对简单：

1. **主要工作**：编辑 `lib/config/schema.json` 添加新端点
2. **代码工作**：创建对应的 Request 类
3. **测试工作**：验证新功能和兼容性

预计需要添加约 25-30 个新端点配置，创建 8-10 个新的请求类。