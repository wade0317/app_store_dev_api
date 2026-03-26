# 撤销 API 密钥

> 官方文档: https://developer.apple.com/documentation/appstoreconnectapi/revoking-api-keys

## 概述

当 API 密钥不再需要、可能泄露、或需要轮换时，应及时撤销。撤销后的密钥将永久失效，使用该密钥生成的所有 JWT Token 也将立即失效。

## 撤销步骤

### 撤销团队密钥

1. 登录 [App Store Connect](https://appstoreconnect.apple.com/)
2. 导航到 **用户和访问 (Users and Access)**
3. 选择 **集成 (Integrations)** 选项卡
4. 在左侧导航中选择 **App Store Connect API**
5. 选择 **团队密钥 (Team Keys)** 标签页
6. 找到要撤销的密钥
7. 点击密钥名称旁的 **撤销 (Revoke)** 按钮
8. 在确认对话框中确认撤销

### 撤销个人密钥

1. 登录 [App Store Connect](https://appstoreconnect.apple.com/)
2. 导航到 **用户和访问 (Users and Access)**
3. 选择 **集成 (Integrations)** 选项卡
4. 选择 **个人密钥 (Individual Keys)** 标签页
5. 找到要撤销的密钥并点击 **撤销 (Revoke)**

## 撤销后的影响

### 立即生效

- 密钥状态变为 **已撤销 (Revoked)**
- 使用该密钥签名的所有 JWT Token 立即失效
- 所有使用该 Token 的 API 请求将返回 `401 NOT_AUTHORIZED`

### 不可逆操作

> ⚠️ **警告**: 密钥撤销是**永久性**操作，无法恢复。一旦撤销，该密钥将无法重新激活。

- 已撤销的密钥仍会显示在密钥列表中（标记为已撤销），但无法使用
- 私钥文件（`.p8`）即使仍存在也无法再用于生成有效 Token
- Key ID 不会被回收利用

### 对正在运行的服务的影响

- 所有依赖该密钥的 CI/CD 流水线将立即中断
- 所有使用该密钥的自动化脚本将失败
- 所有后端服务的 API 调用将返回认证错误

## 何时应该撤销密钥

| 场景 | 紧急程度 | 建议操作 |
|------|----------|----------|
| 私钥文件泄露（提交到公开仓库等） | 🔴 立即 | 立刻撤销，创建新密钥 |
| 团队成员离职 | 🟡 尽快 | 撤销其创建的密钥 |
| 密钥定期轮换 | 🟢 计划中 | 先创建新密钥，迁移后再撤销旧密钥 |
| 密钥权限过高 | 🟡 尽快 | 创建权限适当的新密钥后撤销 |
| 密钥不再使用 | 🟢 常规 | 确认无依赖后撤销 |

## 安全的密钥轮换流程

为避免服务中断，建议按以下步骤进行密钥轮换：

```
1. 创建新密钥
       ↓
2. 下载新私钥文件 (.p8)
       ↓
3. 更新所有服务/脚本使用新密钥
       ↓
4. 验证所有服务正常运行
       ↓
5. 撤销旧密钥
       ↓
6. 删除旧私钥文件
```

### 在本项目中轮换密钥

```ruby
# 1. 使用新密钥创建客户端
new_client = AppStoreDevApi::Client.new(
  issuer_id: ENV['APP_STORE_CONNECT_ISSUER_ID'],  # Issuer ID 不变
  key_id: 'NEW_KEY_ID',
  private_key: File.read('/path/to/new_AuthKey.p8')
)

# 2. 验证新密钥可用
apps = new_client.list_apps
puts "新密钥验证成功，共 #{apps['data'].size} 个应用"

# 3. 确认后，在 App Store Connect 中撤销旧密钥
```

## 常见问题

### 撤销密钥后可以恢复吗？

不可以。密钥撤销是永久性操作。如果误操作，只能创建新密钥。

### 撤销密钥会影响应用吗？

不会。撤销 API 密钥只影响 API 访问能力，不会影响已发布的应用、用户数据或 App Store 上架状态。

### 一个团队最多可以有多少个活跃密钥？

Apple 对每个团队的活跃 API 密钥数量有限制。建议只保留实际使用的密钥，及时撤销不再需要的密钥。

### 撤销后 Issuer ID 会变吗？

不会。Issuer ID 是团队级别的标识，不受单个密钥撤销的影响。

## 相关文档

- [创建 API 密钥](creating_api_keys.md)
- [生成 API 请求 Token](generating_tokens.md)
