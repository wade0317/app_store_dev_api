# API 4.0 升级方案详细说明

## 为什么需要升级？

### 1. Webhooks（事件通知）- 必须升级 ⭐⭐⭐⭐⭐

#### 为什么重要？
Webhooks 是 4.0 版本最重要的新功能，它允许应用接收实时事件通知，而不需要不断轮询 API。

#### 实际应用场景：
```ruby
# 之前：必须定期轮询检查应用状态
loop do
  status = client.get_app_store_version(id: version_id)
  if status.attributes.appStoreState == 'READY_FOR_SALE'
    notify_team("App is live!")
    break
  end
  sleep 300 # 每5分钟检查一次
end

# 升级后：设置 Webhook，自动接收通知
client.create_webhook(
  name: 'App Status Monitor',
  url: 'https://myserver.com/webhook',
  events: ['APP_STORE_VERSION_STATE_CHANGED']
)
# 当状态变化时，Apple 会自动推送通知到你的服务器
```

#### 需要添加的端点：
```json
// schema.json 需要添加
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
  "alias": "update_webhook",
  "http_method": "patch",
  "url": "https://api.appstoreconnect.apple.com/v1/webhooks/{id}",
  "http_body_type": "Requests::V1::Webhook::Update"
},
{
  "alias": "delete_webhook",
  "http_method": "delete",
  "url": "https://api.appstoreconnect.apple.com/v1/webhooks/{id}"
},
{
  "alias": "test_webhook",
  "http_method": "post",
  "url": "https://api.appstoreconnect.apple.com/v1/webhooks/{id}/test"
}
```

#### 需要创建的 Request 类：
```ruby
# lib/app_store_dev_api/requests/v1/webhook/create.rb
module Requests::V1::Webhook
  class Create < Request::Body
    data do
      type 'webhooks'
      attributes do
        property :name, required: true
        property :url, required: true
        property :events, required: true  # ['APP_STORE_VERSION_STATE_CHANGED', 'BUILD_STATE_CHANGED', etc.]
        property :enabled, default: true
      end
    end
  end
end
```

### 2. Customer Review Summarizations（评论摘要）- 必须升级 ⭐⭐⭐⭐

#### 为什么重要？
Apple 现在使用 AI 自动生成用户评论摘要，这对了解用户反馈非常有价值。

#### 实际应用场景：
```ruby
# 之前：必须手动分析所有评论
reviews = client.list_customer_reviews(app_id: 'xxx')
# 需要自己分析几百条评论找出共同问题

# 升级后：直接获取 AI 生成的摘要
summary = client.get_customer_review_summarizations(id: 'app_id')
# 返回结构化的摘要数据：
# {
#   "positiveHighlights": ["Great UI", "Fast performance"],
#   "criticalIssues": ["Crashes on startup", "Battery drain"],
#   "featureRequests": ["Dark mode", "iPad support"]
# }
```

#### 需要添加的端点：
```json
{
  "alias": "get_customer_review_summarizations",
  "http_method": "get",
  "url": "https://api.appstoreconnect.apple.com/v1/apps/{id}/customerReviewSummarizations"
}
```

### 3. TestFlight Feedback（Beta 反馈）- 必须升级 ⭐⭐⭐⭐

#### 为什么重要？
4.0 版本首次提供 API 访问 Beta 测试者提交的崩溃日志和截图，之前只能在网页端查看。

#### 实际应用场景：
```ruby
# 之前：无法通过 API 获取 Beta 反馈的崩溃日志和截图
# 必须登录 App Store Connect 网页查看

# 升级后：可以自动化处理 Beta 反馈
crash_reports = client.list_beta_feedback_crash_submissions(
  filter: { build: build_id }
)

crash_reports.each do |crash|
  # 自动创建 Jira ticket
  jira.create_issue(
    title: "Beta Crash: #{crash.attributes.crashDescription}",
    attachments: [crash.relationships.crashLog]
  )
end

# 获取截图反馈
screenshots = client.list_beta_feedback_screenshot_submissions(
  filter: { build: build_id }
)
```

#### 需要添加的端点：
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

### 4. Accessibility Declarations（无障碍声明）- 合规需求 ⭐⭐⭐

#### 为什么重要？
许多国家/地区要求应用提供无障碍声明，这是合规性要求。

#### 实际应用场景：
```ruby
# 之前：必须在网页上手动填写每个设备类型的无障碍信息

# 升级后：可以通过 API 批量设置
['IPHONE', 'IPAD', 'APPLE_VISION_PRO'].each do |device|
  client.create_accessibility_declaration(
    app_id: app_id,
    deviceFamily: device,
    hasMotion: false,
    hasFlashingLights: false,
    hasStrobingLights: false,
    hasSoundEffects: true,
    hasBackgroundAudio: true,
    isMadeForKids: false
  )
end

# 同时更新 App 的无障碍 URL
client.update_app(
  id: app_id,
  accessibilityURL: 'https://myapp.com/accessibility'  # 新字段
)
```

#### 需要创建的 Request 类：
```ruby
# lib/app_store_dev_api/requests/v1/accessibility_declaration/create.rb
module Requests::V1::AccessibilityDeclaration
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
```

### 5. Background Assets（后台资源）- 性能优化 ⭐⭐⭐

#### 为什么重要？
允许应用在后台下载大型资源包，改善首次启动体验。

#### 实际应用场景：
```ruby
# 游戏可以分离核心包和资源包
# 核心包：50MB（快速下载安装）
# 资源包：2GB（后台下载）

asset = client.create_background_asset(
  app_id: app_id,
  fileName: 'game_assets.pak',
  fileSize: 2147483648,  # 2GB
  sourceFileChecksum: 'sha256:...',
  version: '1.0.0'
)

# 创建下载版本
version = client.create_background_asset_version(
  asset_id: asset.id,
  platform: 'IOS',
  minimumOsVersion: '17.0'
)
```

### 6. 更新现有类的必要性

#### App::Update 类需要新增属性
```ruby
# lib/app_store_dev_api/requests/v1/app/update.rb
class Update < Request::Body
  data do
    attributes do
      # 现有属性...

      # 4.0 新增属性
      property :accessibilityURL  # 新增：无障碍页面链接
      property :streamlinedPurchasingEnabled, default: true  # 新增：简化购买流程
    end
  end
end
```

#### 为什么需要更新？
```ruby
# 实际使用场景
client.update_app(
  id: app_id,
  # 4.0 新功能：设置无障碍页面
  accessibilityURL: 'https://myapp.com/accessibility',
  # 4.0 新功能：启用简化购买（提高转化率）
  streamlinedPurchasingEnabled: true
)
```

### 7. Device 枚举新增 APPLE_VISION_PRO

#### 为什么重要？
Apple Vision Pro 是新的设备类型，需要支持。

```ruby
# 注册支持 Vision Pro 的设备
client.register_device(
  name: 'Test Vision Pro',
  platform: 'APPLE_VISION_PRO',  # 新设备类型
  udid: 'xxxxx'
)

# 为 Vision Pro 创建配置文件
client.create_profile(
  devices: [vision_pro_device_id],
  bundleId: bundle_id,
  profileType: 'IOS_APP_DEVELOPMENT',
  platform: 'APPLE_VISION_PRO'
)
```

## 升级方案验证

### 验证清单

1. **Webhooks** ✅
   - 理由：实时通知，避免轮询
   - 影响：大幅降低 API 调用次数
   - 优先级：最高

2. **Customer Review Summarizations** ✅
   - 理由：AI 生成的评论摘要
   - 影响：快速了解用户反馈
   - 优先级：高

3. **TestFlight Feedback** ✅
   - 理由：自动化处理 Beta 反馈
   - 影响：改善测试流程
   - 优先级：高

4. **Accessibility Declarations** ✅
   - 理由：合规性要求
   - 影响：满足法律要求
   - 优先级：中

5. **Background Assets** ✅
   - 理由：优化大型应用下载
   - 影响：改善用户体验
   - 优先级：中

6. **Game Center 新功能** ✅
   - 理由：游戏应用需求
   - 影响：特定用户群体
   - 优先级：低

## 实施建议

### 第一阶段（必须）
1. Webhooks - 5个端点 + 2个Request类
2. Customer Review Summarizations - 1个端点
3. TestFlight Feedback - 4个端点

### 第二阶段（重要）
1. Accessibility Declarations - 4个端点 + 2个Request类
2. App::Update 类更新 - 添加新属性
3. Device 枚举更新 - 添加 APPLE_VISION_PRO

### 第三阶段（可选）
1. Background Assets - 5个端点 + 2个Request类
2. Game Center 新功能 - 4个端点 + 2个Request类

## 总结

这个升级方案是必要的，因为：

1. **功能缺失**：当前版本无法使用 4.0 的核心功能（Webhooks、AI摘要等）
2. **效率提升**：Webhooks 可以大幅减少 API 调用，提高效率
3. **合规要求**：Accessibility Declarations 是某些地区的法律要求
4. **竞争优势**：使用最新 API 功能可以提供更好的用户体验

升级工作量合理，主要是配置文件更新，代码改动较小。