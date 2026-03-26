# Bundle ID Capabilities - App Store Connect API

> 官方文档: https://developer.apple.com/documentation/appstoreconnectapi/bundle-id-capabilities

## 概述

Bundle ID Capabilities 用于管理 Bundle ID 的功能配置（如推送通知、iCloud、Apple Pay 等）。通过这些 API，你可以为 Bundle ID 启用、更新或移除特定的平台能力。

## 数据模型

### BundleIdCapability 对象

| 字段 | 类型 | 说明 |
|------|------|------|
| `type` | string | 固定值 `"bundleIdCapabilities"` |
| `id` | string | 资源唯一标识 |
| `attributes.capabilityType` | CapabilityType | 能力类型 |
| `attributes.settings` | CapabilitySetting[] | 能力的配置选项列表 |

### CapabilityType 枚举

| 值 | 说明 |
|----|------|
| `ICLOUD` | iCloud 服务 |
| `IN_APP_PURCHASE` | 应用内购买 |
| `GAME_CENTER` | 游戏中心 |
| `PUSH_NOTIFICATIONS` | 推送通知 |
| `WALLET` | 钱包（Passbook） |
| `INTER_APP_AUDIO` | 应用间音频 |
| `MAPS` | 地图 |
| `ASSOCIATED_DOMAINS` | 关联域名 |
| `PERSONAL_VPN` | 个人 VPN |
| `APP_GROUPS` | 应用组 |
| `HEALTHKIT` | 健康套件 |
| `HOMEKIT` | 家居套件 |
| `WIRELESS_ACCESSORY_CONFIGURATION` | 无线配件配置 |
| `APPLE_PAY` | Apple Pay |
| `DATA_PROTECTION` | 数据保护 |
| `SIRIKIT` | Siri 套件 |
| `NETWORK_EXTENSIONS` | 网络扩展 |
| `MULTIPATH` | 多路径 |
| `HOT_SPOT` | 热点 |
| `NFC_TAG_READING` | NFC 标签读取 |
| `CLASSKIT` | ClassKit 教育框架 |
| `AUTOFILL_CREDENTIAL_PROVIDER` | 自动填充凭证提供者 |
| `ACCESS_WIFI_INFORMATION` | 访问 WiFi 信息 |
| `NETWORK_CUSTOM_PROTOCOL` | 自定义网络协议 |
| `COREMEDIA_HLS_LOW_LATENCY` | CoreMedia HLS 低延迟 |
| `SYSTEM_EXTENSION_INSTALL` | 系统扩展安装 |
| `USER_MANAGEMENT` | 用户管理 |
| `APPLE_ID_AUTH` | Apple ID 登录（Sign in with Apple） |

### CapabilitySetting 对象

用于配置特定能力的详细设置。

| 字段 | 类型 | 说明 |
|------|------|------|
| `key` | string | 设置项标识 |
| `name` | string | 设置项名称 |
| `description` | string | 设置项描述 |
| `enabledByDefault` | boolean | 是否默认启用 |
| `visible` | boolean | 是否可见 |
| `allowedInstances` | string | 允许的实例数: `ENTRY`, `SINGLE`, `MULTIPLE` |
| `minInstances` | integer | 最小实例数 |
| `options` | CapabilityOption[] | 可选配置项列表 |

**CapabilitySetting.key 枚举:**

| 值 | 说明 |
|----|------|
| `ICLOUD_VERSION` | iCloud 版本配置 |
| `DATA_PROTECTION_PERMISSION_LEVEL` | 数据保护权限级别 |
| `APPLE_ID_AUTH_APP_CONSENT` | Apple ID 登录应用同意配置 |

### CapabilityOption 对象

能力设置的具体选项。

| 字段 | 类型 | 说明 |
|------|------|------|
| `key` | string | 选项标识 |
| `name` | string | 选项名称 |
| `description` | string | 选项描述 |
| `enabledByDefault` | boolean | 是否默认启用 |
| `enabled` | boolean | 当前是否启用 |
| `supportsWildcard` | boolean | 是否支持通配符 Bundle ID |

**CapabilityOption.key 枚举:**

| 值 | 说明 |
|----|------|
| `XCODE_5` | iCloud - Xcode 5 兼容模式（Key-Value Storage） |
| `XCODE_6` | iCloud - Xcode 6+ 模式（CloudKit） |
| `COMPLETE_PROTECTION` | 数据保护 - 完全保护 |
| `PROTECTED_UNLESS_OPEN` | 数据保护 - 除非打开否则保护 |
| `PROTECTED_UNTIL_FIRST_USER_AUTH` | 数据保护 - 首次用户认证前保护 |
| `PRIMARY_APP_CONSENT` | Apple ID 登录 - 主应用同意 |

---

## API 端点

### 1. 启用 Bundle ID Capability

```
POST /v1/bundleIdCapabilities
```

为指定的 Bundle ID 启用一项新的能力。

#### 请求体 (BundleIdCapabilityCreateRequest)

```json
{
  "data": {
    "type": "bundleIdCapabilities",
    "attributes": {
      "capabilityType": "PUSH_NOTIFICATIONS",
      "settings": []
    },
    "relationships": {
      "bundleId": {
        "data": {
          "type": "bundleIds",
          "id": "BUNDLE_ID_RESOURCE_ID"
        }
      }
    }
  }
}
```

**必填字段:**

| 字段 | 类型 | 说明 |
|------|------|------|
| `attributes.capabilityType` | CapabilityType | **必填** - 要启用的能力类型 |
| `relationships.bundleId.data.id` | string | **必填** - 目标 Bundle ID 的资源 ID |

**可选字段:**

| 字段 | 类型 | 说明 |
|------|------|------|
| `attributes.settings` | CapabilitySetting[] | 可选 - 能力配置选项（nullable） |

#### 需要配置 settings 的能力类型

大多数能力只需指定 `capabilityType`，但以下能力需要提供 `settings`：

**iCloud (`ICLOUD`)**
```json
{
  "settings": [
    {
      "key": "ICLOUD_VERSION",
      "options": [
        { "key": "XCODE_6", "enabled": true }
      ]
    }
  ]
}
```

**数据保护 (`DATA_PROTECTION`)**
```json
{
  "settings": [
    {
      "key": "DATA_PROTECTION_PERMISSION_LEVEL",
      "options": [
        { "key": "COMPLETE_PROTECTION", "enabled": true }
      ]
    }
  ]
}
```

**Apple ID 登录 (`APPLE_ID_AUTH`)**
```json
{
  "settings": [
    {
      "key": "APPLE_ID_AUTH_APP_CONSENT",
      "options": [
        { "key": "PRIMARY_APP_CONSENT", "enabled": true }
      ]
    }
  ]
}
```

#### 响应

| 状态码 | 说明 | 响应体 |
|--------|------|--------|
| 201 | 创建成功 | `BundleIdCapabilityResponse` |
| 400 | 请求参数错误 | `ErrorResponse` |
| 401 | 未认证 | `ErrorResponse` |
| 403 | 无权限 | `ErrorResponse` |
| 409 | 资源冲突（能力已启用） | `ErrorResponse` |
| 422 | 请求体无法处理 | `ErrorResponse` |
| 429 | 请求过于频繁 | `ErrorResponse` |

---

### 2. 更新 Bundle ID Capability

```
PATCH /v1/bundleIdCapabilities/{id}
```

更新已启用的 Capability 配置。

#### 路径参数

| 参数 | 类型 | 说明 |
|------|------|------|
| `id` | string | **必填** - Capability 资源的唯一标识 |

#### 请求体 (BundleIdCapabilityUpdateRequest)

```json
{
  "data": {
    "type": "bundleIdCapabilities",
    "id": "CAPABILITY_RESOURCE_ID",
    "attributes": {
      "capabilityType": "DATA_PROTECTION",
      "settings": [
        {
          "key": "DATA_PROTECTION_PERMISSION_LEVEL",
          "options": [
            { "key": "PROTECTED_UNLESS_OPEN", "enabled": true }
          ]
        }
      ]
    }
  }
}
```

**可更新字段:**

| 字段 | 类型 | 说明 |
|------|------|------|
| `attributes.capabilityType` | CapabilityType | 可选 - 能力类型（nullable） |
| `attributes.settings` | CapabilitySetting[] | 可选 - 更新的配置选项（nullable） |

#### 响应

| 状态码 | 说明 | 响应体 |
|--------|------|--------|
| 200 | 更新成功 | `BundleIdCapabilityResponse` |
| 400 | 请求参数错误 | `ErrorResponse` |
| 401 | 未认证 | `ErrorResponse` |
| 403 | 无权限 | `ErrorResponse` |
| 404 | 资源不存在 | `ErrorResponse` |
| 409 | 资源冲突 | `ErrorResponse` |
| 422 | 请求体无法处理 | `ErrorResponse` |
| 429 | 请求过于频繁 | `ErrorResponse` |

---

### 3. 移除 Bundle ID Capability

```
DELETE /v1/bundleIdCapabilities/{id}
```

移除 Bundle ID 上已启用的能力。

#### 路径参数

| 参数 | 类型 | 说明 |
|------|------|------|
| `id` | string | **必填** - Capability 资源的唯一标识 |

#### 响应

| 状态码 | 说明 |
|--------|------|
| 204 | 删除成功（无响应体） |
| 400 | 请求参数错误 |
| 401 | 未认证 |
| 403 | 无权限 |
| 404 | 资源不存在 |
| 429 | 请求过于频繁 |

---

## 端点汇总

| 方法 | 路径 | 说明 |
|------|------|------|
| `POST` | `/v1/bundleIdCapabilities` | 为 Bundle ID 启用新能力 |
| `PATCH` | `/v1/bundleIdCapabilities/{id}` | 更新已启用的能力配置 |
| `DELETE` | `/v1/bundleIdCapabilities/{id}` | 移除已启用的能力 |

> 查询 Bundle ID 关联的 Capabilities 请参见 [Bundle IDs](bundle_ids.md) 文档中的关联端点。

---

## 使用示例

### 为 Bundle ID 启用推送通知

```json
POST /v1/bundleIdCapabilities

{
  "data": {
    "type": "bundleIdCapabilities",
    "attributes": {
      "capabilityType": "PUSH_NOTIFICATIONS"
    },
    "relationships": {
      "bundleId": {
        "data": {
          "type": "bundleIds",
          "id": "ABC123DEF"
        }
      }
    }
  }
}
```

### 为 Bundle ID 启用 iCloud（CloudKit 模式）

```json
POST /v1/bundleIdCapabilities

{
  "data": {
    "type": "bundleIdCapabilities",
    "attributes": {
      "capabilityType": "ICLOUD",
      "settings": [
        {
          "key": "ICLOUD_VERSION",
          "options": [
            { "key": "XCODE_6", "enabled": true }
          ]
        }
      ]
    },
    "relationships": {
      "bundleId": {
        "data": {
          "type": "bundleIds",
          "id": "ABC123DEF"
        }
      }
    }
  }
}
```

### 更新数据保护级别

```json
PATCH /v1/bundleIdCapabilities/CAP_ID_123

{
  "data": {
    "type": "bundleIdCapabilities",
    "id": "CAP_ID_123",
    "attributes": {
      "capabilityType": "DATA_PROTECTION",
      "settings": [
        {
          "key": "DATA_PROTECTION_PERMISSION_LEVEL",
          "options": [
            { "key": "COMPLETE_PROTECTION", "enabled": true }
          ]
        }
      ]
    }
  }
}
```
