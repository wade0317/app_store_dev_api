# App Store Connect API 4.0 最终升级实施计划

## 📋 执行摘要

基于官方文档分析，API 4.0 新增了 **33 个端点**，分布在 5 个主要功能模块。本计划提供详细的实施步骤。

## 📊 升级范围统计

| 功能模块 | 新增端点数 | Request类需求 | 优先级 |
|---------|-----------|--------------|--------|
| Webhooks | 11 | 3个 | P0-最高 |
| Background Assets | 10 | 2个 | P2-中等 |
| Accessibility | 6 | 1个 | P1-高 |
| Customer Review | 3 | 0个 | P0-最高 |
| Beta Feedback | 3 | 0个 | P1-高 |
| **总计** | **33** | **6个** | - |

## 🚀 第一阶段：核心功能升级（P0 - 2天）

### 1.1 Webhooks 实施（11个端点）

#### schema.json 配置添加：
```json
{
  "alias": "list_app_webhooks",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/apps/{id}/webhooks"
},
{
  "alias": "get_webhook",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/webhooks/{id}"
},
{
  "alias": "list_webhook_deliveries",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/webhooks/{id}/deliveries"
},
{
  "alias": "get_webhook_delivery_relationships",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/webhooks/{id}/relationships/deliveries"
},
{
  "alias": "create_webhook",
  "http_method": "post",
  "url": "https://api.appstoreconnect.apple.com/v1/webhooks",
  "http_body_type": "Requests::V1::Webhook::Create"
},
{
  "alias": "redeliver_webhook",
  "http_method": "post",
  "url": "https://api.appstoreconnect.apple.com/v1/webhookdeliveries",
  "http_body_type": "Requests::V1::WebhookDelivery::Create"
},
{
  "alias": "test_webhook",
  "http_method": "post",
  "url": "https://api.appstoreconnect.apple.com/v1/webhookpings",
  "http_body_type": "Requests::V1::WebhookPing::Create"
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

#### Request 类创建：
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
              property :events, required: true  # Array of WebhookEventType
              property :enabled, default: true
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

# lib/app_store_dev_api/requests/v1/webhook_ping/create.rb
module AppStoreDevApi
  module Requests
    module V1
      module WebhookPing
        class Create < Request::Body
          data do
            type 'webhookPings'
            relationships do
              property :webhook, required: true
            end
          end
        end
      end
    end
  end
end
```

### 1.2 Customer Review Summarizations（3个端点）

#### schema.json 配置添加：
```json
{
  "alias": "list_customer_reviews",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/apps/{id}/customerReviews"
},
{
  "alias": "get_customer_review_relationships",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/apps/{id}/relationships/customerReviews"
},
{
  "alias": "get_customer_review_summarizations",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/apps/{id}/customerReviewSummarizations"
}
```

## 🔧 第二阶段：重要功能升级（P1 - 2天）

### 2.1 Accessibility Declarations（6个端点）

#### schema.json 配置添加：
```json
{
  "alias": "list_app_accessibility_declarations",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/apps/{id}/accessibilityDeclarations"
},
{
  "alias": "get_app_accessibility_relationships",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/apps/{id}/relationships/accessibilityDeclarations"
},
{
  "alias": "get_accessibility_declaration",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/accessibilityDeclarations/{id}"
},
{
  "alias": "create_accessibility_declaration",
  "http_method": "post",
  "url": "https://api.appstoreconnect.apple.com/v1/accessibilityDeclarations",
  "http_body_type": "Requests::V1::AccessibilityDeclaration::Create"
},
{
  "alias": "update_accessibility_declaration",
  "http_method": "patch",
  "url": "https://api.appstoreconnect.apple.com/v1/accessibilityDeclarations/{id}",
  "http_body_type": "Requests::V1::AccessibilityDeclaration::Update"
},
{
  "alias": "delete_accessibility_declaration",
  "http_method": "delete",
  "url": "https://api.appstoreconnect.apple.com/v1/accessibilityDeclarations/{id}"
}
```

#### Request 类创建：
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

### 2.2 TestFlight Beta Feedback（3个端点）

#### schema.json 配置添加：
```json
{
  "alias": "list_beta_feedback_crash_submissions",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/apps/{id}/betaFeedbackCrashSubmissions"
},
{
  "alias": "list_beta_feedback_screenshot_submissions",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/apps/{id}/betaFeedbackScreenshotSubmissions"
},
{
  "alias": "get_beta_tester_usage_metrics",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/apps/{id}/metrics/betaTesterUsages"
}
```

### 2.3 更新 App::Update 类

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

              # API 4.0 新增属性
              property :accessibilityURL  # 无障碍说明页面URL
              property :streamlinedPurchasingEnabled, default: true  # 简化购买流程
            end
          end
        end
      end
    end
  end
end
```

## 📦 第三阶段：扩展功能升级（P2 - 2天）

### 3.1 Background Assets（10个端点）

#### schema.json 配置添加：
```json
{
  "alias": "list_app_background_assets",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/apps/{id}/backgroundassets"
},
{
  "alias": "get_app_background_assets_relationships",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/apps/{id}/relationships/backgroundassets"
},
{
  "alias": "create_background_asset",
  "http_method": "post",
  "url": "https://api.appstoreconnect.apple.com/v1/backgroundassets",
  "http_body_type": "Requests::V1::BackgroundAsset::Create"
},
{
  "alias": "create_background_asset_version",
  "http_method": "post",
  "url": "https://api.appstoreconnect.apple.com/v1/backgroundassetversions",
  "http_body_type": "Requests::V1::BackgroundAssetVersion::Create"
},
{
  "alias": "commit_background_asset_upload",
  "http_method": "patch",
  "url": "https://api.appstoreconnect.apple.com/v1/backgroundassetuploadfiles/{id}"
},
{
  "alias": "get_background_asset",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/backgroundassets/{id}"
},
{
  "alias": "get_background_asset_versions",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/backgroundassets/{id}/versions"
},
{
  "alias": "get_background_asset_version_relationships",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/backgroundassets/{id}/relationships/versions"
},
{
  "alias": "get_background_asset_version",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/backgroundassetversions/{id}"
},
{
  "alias": "get_background_asset_upload_files",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/backgroundassetversions/{id}/backgroundassetuploadfiles"
}
```

## ✅ 实施检查清单

### 准备阶段
- [ ] 备份当前 `lib/config/schema.json`
- [ ] 创建新分支 `feature/api-v4-upgrade`
- [ ] 更新版本号到 0.2.0

### 第一阶段（Day 1-2）
- [ ] 添加 Webhooks 11个端点到 schema.json
- [ ] 创建 Webhook::Create 请求类
- [ ] 创建 Webhook::Update 请求类
- [ ] 创建 WebhookPing::Create 请求类
- [ ] 添加 Customer Review 3个端点到 schema.json
- [ ] 编写 Webhooks 单元测试
- [ ] 编写 Customer Review 单元测试

### 第二阶段（Day 3-4）
- [ ] 添加 Accessibility 6个端点到 schema.json
- [ ] 创建 AccessibilityDeclaration::Create 请求类
- [ ] 添加 Beta Feedback 3个端点到 schema.json
- [ ] 更新 App::Update 类添加新属性
- [ ] 编写 Accessibility 单元测试
- [ ] 编写 Beta Feedback 单元测试

### 第三阶段（Day 5-6）
- [ ] 添加 Background Assets 10个端点到 schema.json
- [ ] 创建 BackgroundAsset::Create 请求类
- [ ] 创建 BackgroundAssetVersion::Create 请求类
- [ ] 编写 Background Assets 单元测试
- [ ] 集成测试所有新功能

### 收尾阶段
- [ ] 更新 README.md 文档
- [ ] 创建迁移指南
- [ ] 运行完整测试套件
- [ ] 创建 Pull Request
- [ ] 发布 0.2.0 版本

## 🎯 成功标准

1. **功能完整性**：33个新端点全部实现
2. **测试覆盖**：所有新功能有单元测试
3. **文档完善**：更新 README 和 API 文档
4. **向后兼容**：现有功能不受影响
5. **性能指标**：API 调用响应时间不增加

## 📝 使用示例

```ruby
# Webhooks 使用
client = AppStoreDevApi::Client.new(...)

webhook = client.create_webhook(
  app_id: 'xxx',
  name: 'Production Notifications',
  url: 'https://api.myapp.com/webhooks/appstore',
  events: ['APP_STORE_VERSION_STATE_CHANGED', 'BUILD_STATE_CHANGED'],
  enabled: true
)

# Customer Review Summarizations 使用
summaries = client.get_customer_review_summarizations(id: app_id)
puts summaries.data.attributes.positive_highlights
puts summaries.data.attributes.critical_issues

# Accessibility Declarations 使用
client.create_accessibility_declaration(
  app_id: app_id,
  deviceFamily: 'IPHONE',
  hasMotion: false,
  hasFlashingLights: false,
  isMadeForKids: false
)

# Beta Feedback 使用
crashes = client.list_beta_feedback_crash_submissions(id: app_id)
screenshots = client.list_beta_feedback_screenshot_submissions(id: app_id)
```

## 🚨 风险管理

| 风险 | 影响 | 缓解措施 |
|------|------|----------|
| API 文档不完整 | 中 | 参考 OpenAPI 规范文件 |
| 破坏现有功能 | 高 | 完整的测试覆盖 |
| 性能下降 | 低 | 性能基准测试 |
| 版本兼容性 | 中 | 保持向后兼容 |

## 📅 时间线

- **总工期**：6个工作日
- **开始日期**：待定
- **目标发布**：v0.2.0

---

**批准人**：_____________
**日期**：_____________