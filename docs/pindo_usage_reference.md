# Pindo 项目中 app_store_dev_api 使用参考

> 本文档记录 [pindo](../../pindo) CLI 工具如何使用 `app_store_dev_api` gem 进行 App Store Connect API 认证和调用，作为集成参考。

## Gem 依赖

```ruby
# pindo.gemspec
spec.add_runtime_dependency "app_store_dev_api", '~> 0.3.0'
```

## 认证流程

Pindo 采用 **本地 JSON 文件 + 交互式输入** 的方式管理 API 密钥凭证。

### 流程图

```
启动命令 (pindo appstore iap)
       ↓
从项目 config.json 读取 apple_id、bundle_id
       ↓
检查 {pindo_dir}/api_key.json 是否存在该 apple_id 的凭证
       ↓
  ┌─── 存在 ───┐          ┌─── 不存在 ───┐
  │            │          │              │
  │ 直接加载    │          │ 交互式输入     │
  │ issuer_id  │          │ issuer_id    │
  │ key_id     │          │ key_id       │
  │ private_key│          │ .p8 文件路径   │
  │            │          │              │
  └─────┬──────┘          │ 读取 .p8 文件  │
        │                 │ 用户确认       │
        │                 │ 保存到 JSON    │
        │                 └──────┬────────┘
        │                        │
        └────────┬───────────────┘
                 ↓
  AppStoreDevApi::Client.new(
    issuer_id: issuer_id,
    key_id: key_id,
    private_key: private_key
  )
                 ↓
         开始调用 API
```

### 核心代码

**文件:** `pindo/lib/pindo/command/appstore/iap.rb`

```ruby
def login_api_key(apple_id: nil)
  load_apikey_config = false
  api_key_json = nil
  pindo_dir = File.expand_path(pindo_single_config.pindo_dir)
  api_key_file = File.join(pindo_dir, "api_key.json")

  # 步骤1：尝试从本地配置文件加载
  if File.exist?(api_key_file)
    api_key_json = JSON.parse(File.read(api_key_file))
    if !api_key_json.nil? && !api_key_json[apple_id].nil? && !api_key_json[apple_id]["issuer_id"].nil?
      issuer_id = api_key_json[apple_id]["issuer_id"]
      key_id = api_key_json[apple_id]["key_id"]
      private_key = api_key_json[apple_id]["private_key"]
      load_apikey_config = true
    end
  end

  # 步骤2：如果未加载，交互式输入凭证
  if !load_apikey_config
    issuer_id = ask('请输入 issuer_id: ')
    key_id = ask('请输入 key_id: ')
    private_key_file = ask('请输入private key的文件路径: ')
    private_key = File.read(File.new(private_key_file))

    # 构建配置
    api_key_json = api_key_json || {}
    api_key_json[apple_id] = api_key_json[apple_id] || {}
    api_key_json[apple_id]["issuer_id"] = issuer_id
    api_key_json[apple_id]["key_id"] = key_id
    api_key_json[apple_id]["private_key"] = private_key

    # 步骤3：用户确认
    answer = agree("请确认上面信息是否正确(Y/n）:")
    unless answer
      raise Informative, "重新输入 !!!"
    end

    # 步骤4：持久化到本地文件
    File.open(api_key_file, "w") do |f|
      f.write(JSON.pretty_generate(api_key_json))
    end
    load_apikey_config = true
  end

  # 步骤5：初始化 API 客户端
  if load_apikey_config
    @app_store_connect = AppStoreDevApi::Client.new(
      issuer_id: issuer_id,
      key_id: key_id,
      private_key: private_key
    )
  end
end
```

## 凭证存储格式

### 存储路径

```
{pindo_dir}/api_key.json
```

`pindo_dir` 由 `pindo_single_config.pindo_dir` 确定，通常位于用户本地配置目录。

### JSON 结构（支持多账户）

```json
{
  "user1@example.com": {
    "issuer_id": "57246542-96fe-1a63-e053-0824d011072a",
    "key_id": "2X9R4HXF34",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIGTAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBHkwdwIBAQQg...\n-----END PRIVATE KEY-----"
  },
  "user2@example.com": {
    "issuer_id": "69384721-abcd-efgh-ijkl-123456789012",
    "key_id": "ABC123DEF4",
    "private_key": "-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----"
  }
}
```

**关键设计:**
- 以 Apple ID（邮箱）作为一级 key，支持多账户切换
- `private_key` 直接存储 PEM 格式的私钥内容（非文件路径）
- 首次输入时从 `.p8` 文件读取，之后直接使用存储的内容

## API 调用示例

### 初始化入口

```ruby
def run
  # 从项目 config.json 加载 apple_id 和 bundle_id
  config_file = File.join(project_dir, "config.json")
  config_parser = Pindo::IosConfigParser.instance
  config_parser.load_config(config_file: config_file)
  @bundle_id = config_parser.bundle_id
  @apple_id = config_parser.apple_id

  # 登录并初始化客户端
  login_api_key(apple_id: @apple_id)

  # 开始使用 API...
end
```

### 查询应用

```ruby
app_list_response = @app_store_connect.list_apps(
  filter: { bundle_id: @bundle_id }
)
```

### 获取内购项目

```ruby
# 消耗型内购
get_consumable_iap_items(
  appstore_client: @app_store_connect,
  app_id: app_id,
  in_app_purchase_type: "CONSUMABLE"
)

# 订阅组
get_subscriptions_groups(
  appstore_client: @app_store_connect,
  app_id: app_id
)
```

### 沙盒测试账户

```ruby
@app_store_connect.list_sandbox_testers()
```

## 其他集成点

Pindo 中还有以下任务类支持 API Key 认证参数（通过 options 传递）：

### 截图上传任务

**文件:** `pindo/lib/pindo/module/task/model/appstore/appstore_upload_screenshot_task.rb`

```ruby
def initialize(app_id, screenshot_path, options = {})
  @api_key_id    = options[:api_key_id]       # API Key ID
  @api_issuer_id = options[:api_issuer_id]    # Issuer ID
  @api_key_path  = options[:api_key_path]     # .p8 文件路径
end
```

### 元数据上传任务

**文件:** `pindo/lib/pindo/module/task/model/appstore/appstore_upload_metadata_task.rb`

```ruby
@api_key_id    = options[:api_key_id]
@api_issuer_id = options[:api_issuer_id]
@api_key_path  = options[:api_key_path]
```

> 注意：这些任务类使用的是 **文件路径** (`api_key_path`) 而非私钥内容，与 IAP 命令的处理方式略有不同。

## 设计要点总结

| 特性 | 说明 |
|------|------|
| 多账户支持 | 以 Apple ID 为 key 管理多套凭证 |
| 本地持久化 | JSON 文件存储，首次输入后免重复 |
| 交互式输入 | 首次使用通过命令行交互式收集凭证 |
| 私钥存储方式 | 存储 PEM 内容而非文件路径 |
| Client 初始化 | 三个参数: `issuer_id`, `key_id`, `private_key` |
| Token 管理 | 由 `app_store_dev_api` gem 内部自动处理 JWT 生成 |

## 相关文档

- [创建 API 密钥](creating_api_keys.md)
- [生成 API 请求 Token](generating_tokens.md)
- [撤销 API 密钥](revoking_api_keys.md)
