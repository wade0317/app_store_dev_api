# 生成 API 请求 Token

> 官方文档: https://developer.apple.com/documentation/appstoreconnectapi/generating-tokens-for-api-requests

## 概述

App Store Connect API 使用 **JSON Web Token (JWT)** 进行身份认证。每次 API 请求都需要在 HTTP 请求头中携带有效的 JWT Token。Token 使用 ES256（ECDSA P-256）算法签名，有效期最长 20 分钟。

## JWT Token 结构

JWT Token 由三部分组成，以 `.` 分隔：

```
{Header}.{Payload}.{Signature}
```

### 1. Header（头部）

```json
{
  "alg": "ES256",
  "kid": "2X9R4HXF34",
  "typ": "JWT"
}
```

| 字段 | 类型 | 必填 | 说明 |
|------|------|------|------|
| `alg` | string | 是 | 签名算法，固定为 `ES256` |
| `kid` | string | 是 | API 密钥 ID（Key ID） |
| `typ` | string | 是 | Token 类型，固定为 `JWT` |

### 2. Payload（载荷）

```json
{
  "iss": "57246542-96fe-1a63-e053-0824d011072a",
  "iat": 1711416000,
  "exp": 1711417200,
  "aud": "appstoreconnect-v1"
}
```

| 字段 | 类型 | 必填 | 说明 |
|------|------|------|------|
| `iss` | string | 是 | Issuer ID - 你的团队发行者 ID |
| `iat` | number | 是 | Issued At - Token 签发时间（Unix 时间戳，秒） |
| `exp` | number | 是 | Expiration - Token 过期时间（Unix 时间戳，秒） |
| `aud` | string | 是 | Audience - 固定为 `appstoreconnect-v1` |
| `scope` | array | 否 | 权限范围（仅个人密钥需要指定） |

### 3. Signature（签名）

使用 API 私钥（`.p8` 文件）以 ES256 算法对 `{Header}.{Payload}` 进行签名。

## Token 有效期规则

- **最长有效期**: 20 分钟（1200 秒）
- `exp` 不得超过 `iat + 1200`
- 过期后的 Token 会被 API 拒绝，返回 `401 Unauthorized`
- 建议在 Token 过期前主动刷新

## 请求头格式

```http
Authorization: Bearer eyJhbGciOiJFUzI1NiIsImtpZCI6IjJYOVI0SFhGMzQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiI1NzI0NjU0Mi05NmZlLTFhNjMtZTA1My0wODI0ZDAxMTA3MmEiLCJpYXQiOjE3MTE0MTYwMDAsImV4cCI6MTcxMTQxNzIwMCwiYXVkIjoiYXBwc3RvcmVjb25uZWN0LXYxIn0.{signature}
Content-Type: application/json
```

## 本项目的实现

`app_store_dev_api` gem 内置了完整的 JWT Token 生成机制，无需手动处理。

### 核心实现 (`Client::Authorization`)

```ruby
# lib/app_store_dev_api/client/authorization.rb

module AppStoreDevApi
  class Client
    class Authorization
      AUDIENCE  = 'appstoreconnect-v1'
      ALGORITHM = 'ES256'

      def initialize(options)
        @key_id     = options.fetch(:key_id)
        @issuer_id  = options.fetch(:issuer_id)
        @private_key = OpenSSL::PKey.read(options.fetch(:private_key))
      end

      def payload
        current_time = Time.now.to_i
        {
          iss: @issuer_id,         # Issuer ID
          iat: current_time,        # 签发时间
          exp: current_time + 20 * 60, # 20 分钟后过期
          aud: AUDIENCE             # appstoreconnect-v1
        }
      end

      def header_fields
        {
          kid: @key_id,  # API Key ID
          typ: 'JWT'
        }
      end

      def token
        JWT.encode(payload, @private_key, ALGORITHM, header_fields)
      end
    end
  end
end
```

### 请求认证流程

```ruby
# lib/app_store_dev_api/base.rb

def headers
  {
    'Authorization' => "Bearer #{@authorization.token}",
    'Content-Type'  => 'application/json'
  }
end
```

每次 API 请求时，gem 会自动生成新的 JWT Token 并附加到请求头中。

## 其他语言实现参考

### Python

```python
import jwt
import time

# 读取私钥
with open('AuthKey_2X9R4HXF34.p8', 'r') as f:
    private_key = f.read()

# 生成 Token
header = {
    "alg": "ES256",
    "kid": "2X9R4HXF34",
    "typ": "JWT"
}

payload = {
    "iss": "57246542-96fe-1a63-e053-0824d011072a",
    "iat": int(time.time()),
    "exp": int(time.time()) + 20 * 60,
    "aud": "appstoreconnect-v1"
}

token = jwt.encode(payload, private_key, algorithm="ES256", headers=header)
```

### cURL

```bash
# 假设 TOKEN 变量中已有生成的 JWT Token
curl -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type: application/json" \
     https://api.appstoreconnect.apple.com/v1/apps
```

## 常见错误

| 错误 | 原因 | 解决方案 |
|------|------|----------|
| `401 NOT_AUTHORIZED` | Token 过期或无效 | 检查 Token 是否过期，重新生成 |
| `401 NOT_AUTHORIZED` | 私钥不匹配 | 确认使用了正确的 `.p8` 私钥文件 |
| `401 NOT_AUTHORIZED` | Issuer ID 错误 | 在 App Store Connect 中核实 Issuer ID |
| `403 FORBIDDEN` | API 密钥权限不足 | 确认密钥角色拥有对应 API 的访问权限 |
| `429 RATE_LIMIT_EXCEEDED` | 请求频率过高 | 降低请求频率，实施退避策略 |

## 最佳实践

1. **Token 复用** - 在有效期内复用同一 Token，避免每次请求都生成新 Token
2. **提前刷新** - 在 Token 过期前 1-2 分钟主动刷新，避免请求失败
3. **安全存储** - 不要在日志、URL 参数或前端代码中暴露 Token
4. **错误处理** - 收到 `401` 响应时自动刷新 Token 并重试

## 相关文档

- [创建 API 密钥](creating_api_keys.md)
- [撤销 API 密钥](revoking_api_keys.md)
