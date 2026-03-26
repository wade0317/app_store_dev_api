# 创建 App Store Connect API 密钥

> 官方文档: https://developer.apple.com/documentation/appstoreconnectapi/creating-api-keys-for-app-store-connect-api

## 概述

要使用 App Store Connect API，你需要先创建 API 密钥来进行身份认证。Apple 提供了两种类型的 API 密钥：**团队密钥 (Team Keys)** 和 **个人密钥 (Individual Keys)**。

## 密钥类型

### 团队密钥 (Team Keys)

- 由 **Admin（管理员）** 角色创建和管理
- 作用于整个开发者团队
- 可分配不同的角色权限
- 适用于 CI/CD 自动化、后端服务等场景

### 个人密钥 (Individual Keys)

- 由任何团队成员为自己创建
- 权限范围与创建者的角色一致
- 适用于个人开发工具和脚本

## 创建步骤

### 前置条件

- 拥有 Apple Developer Program 会员资格
- 拥有 App Store Connect 的 Admin 角色（创建团队密钥时需要）
- 访问 [App Store Connect](https://appstoreconnect.apple.com/)

### 创建团队 API 密钥

1. 登录 [App Store Connect](https://appstoreconnect.apple.com/)
2. 导航到 **用户和访问 (Users and Access)**
3. 选择 **集成 (Integrations)** 选项卡
4. 在左侧导航中选择 **App Store Connect API**
5. 选择 **团队密钥 (Team Keys)** 标签页
6. 点击 **生成 API 密钥 (Generate API Key)** 或 **+** 按钮
7. 输入密钥名称（用于标识用途）
8. 选择密钥的访问权限（角色）
9. 点击 **生成 (Generate)**

### 密钥角色权限

创建团队密钥时，可分配以下角色：

| 角色 | 说明 |
|------|------|
| Admin | 完全管理权限，可执行所有 API 操作 |
| Finance | 财务数据访问权限 |
| App Manager | 应用管理权限 |
| Developer | 开发相关权限 |
| Marketing | 营销相关权限 |
| Sales | 销售数据访问权限 |
| Customer Support | 客户支持权限 |
| Read Only | 只读访问权限 |

## 密钥属性

创建 API 密钥后，你将获得以下三个关键信息：

### 1. Issuer ID（发行者 ID）

- 格式：UUID（如 `57246542-96fe-1a63-e053-0824d011072a`）
- 对整个团队唯一，所有 API 密钥共享同一个 Issuer ID
- 在 App Store Connect 的 **密钥 (Keys)** 页面顶部可以找到
- 用于 JWT Token 的 `iss` 声明

### 2. Key ID（密钥 ID）

- 格式：10 位字母数字字符串（如 `2X9R4HXF34`）
- 每个 API 密钥唯一
- 在密钥列表中显示
- 用于 JWT Token Header 的 `kid` 字段

### 3. Private Key（私钥）

- 格式：ECDSA P-256 私钥（`.p8` 文件）
- 使用 ES256 算法
- **仅在创建时可下载一次**

## 下载私钥

> ⚠️ **重要提示**: 私钥文件 (.p8) 只能在创建后下载一次。如果丢失，需要撤销当前密钥并创建新的。

1. 创建密钥后，点击 **下载 API 密钥 (Download API Key)**
2. 保存 `.p8` 文件到安全位置
3. 文件名格式为 `AuthKey_{Key ID}.p8`（如 `AuthKey_2X9R4HXF34.p8`）

### 私钥文件格式

```
-----BEGIN PRIVATE KEY-----
MIGTAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBHkwdwIBAQQg...
(Base64 编码的 ECDSA P-256 私钥数据)
...
-----END PRIVATE KEY-----
```

## 安全建议

1. **妥善保管私钥** - 将私钥存储在安全的密钥管理系统中（如 Vault、AWS Secrets Manager）
2. **不要提交到代码仓库** - 将 `.p8` 文件添加到 `.gitignore`
3. **使用环境变量** - 通过环境变量传递私钥内容，而非硬编码文件路径
4. **最小权限原则** - 为 API 密钥分配完成任务所需的最小权限角色
5. **定期轮换** - 定期撤销旧密钥并创建新密钥
6. **限制密钥数量** - 每个团队最多可创建的活跃密钥数量有限

## 在本项目中使用

使用 `app_store_dev_api` gem 时，需要提供以上三个凭证信息：

```ruby
require 'app_store_dev_api'

# 方式一：直接传入私钥内容
client = AppStoreDevApi::Client.new(
  issuer_id: '57246542-96fe-1a63-e053-0824d011072a',
  key_id: '2X9R4HXF34',
  private_key: File.read('/path/to/AuthKey_2X9R4HXF34.p8')
)

# 方式二：通过环境变量
client = AppStoreDevApi::Client.new(
  issuer_id: ENV['APP_STORE_CONNECT_ISSUER_ID'],
  key_id: ENV['APP_STORE_CONNECT_KEY_ID'],
  private_key: ENV['APP_STORE_CONNECT_PRIVATE_KEY']
)
```

初始化后，gem 会自动处理 JWT Token 的生成和 API 请求认证。

## 相关文档

- [生成 API 请求 Token](generating_tokens.md)
- [撤销 API 密钥](revoking_api_keys.md)
