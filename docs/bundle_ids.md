# Bundle IDs - App Store Connect API

> 官方文档: https://developer.apple.com/documentation/appstoreconnectapi/bundle-ids

## 概述

Bundle IDs 是用于标识 iOS、macOS 或通用平台应用的唯一标识符。通过 App Store Connect API，你可以注册、查询、更新和删除 Bundle ID，并管理其关联的 App、Capabilities 和 Profiles。

## 数据模型

### BundleId 对象

| 字段 | 类型 | 说明 |
|------|------|------|
| `type` | string | 固定值 `"bundleIds"` |
| `id` | string | 资源唯一标识 |
| `attributes.name` | string | Bundle ID 显示名称 |
| `attributes.platform` | BundleIdPlatform | 平台类型 |
| `attributes.identifier` | string | Bundle ID 标识符（如 `com.example.app`） |
| `attributes.seedId` | string | Team Seed ID |

### BundleIdPlatform 枚举

| 值 | 说明 |
|----|------|
| `IOS` | iOS 平台 |
| `MAC_OS` | macOS 平台 |
| `UNIVERSAL` | 通用平台（iOS + macOS） |

### 关联关系 (Relationships)

| 关系 | 类型 | 说明 |
|------|------|------|
| `profiles` | Profiles[] | 关联的配置文件 |
| `bundleIdCapabilities` | BundleIdCapability[] | 关联的能力配置 |
| `app` | App | 关联的应用 |

---

## API 端点

### 1. 列出所有 Bundle IDs

```
GET /v1/bundleIds
```

获取所有已注册的 Bundle ID 列表。

#### 查询参数

**过滤 (Filter)**

| 参数 | 类型 | 说明 |
|------|------|------|
| `filter[name]` | string | 按名称过滤 |
| `filter[platform]` | string | 按平台过滤，可选值: `IOS`, `MAC_OS`, `UNIVERSAL` |
| `filter[identifier]` | string | 按标识符过滤 |
| `filter[seedId]` | string | 按 Seed ID 过滤 |
| `filter[id]` | string | 按资源 ID 过滤 |

**排序 (Sort)**

| 参数 | 说明 |
|------|------|
| `sort` | 排序字段，可选: `name`, `-name`, `platform`, `-platform`, `identifier`, `-identifier`, `seedId`, `-seedId`, `id`, `-id` |

**字段选择 (Fields)**

| 参数 | 可选值 |
|------|--------|
| `fields[bundleIds]` | `name`, `platform`, `identifier`, `seedId`, `profiles`, `bundleIdCapabilities`, `app` |
| `fields[profiles]` | `name`, `platform`, `profileType`, `profileState`, `profileContent`, `uuid`, `createdDate`, `expirationDate`, `bundleId`, `devices`, `certificates` |
| `fields[bundleIdCapabilities]` | `capabilityType`, `settings` |
| `fields[apps]` | `name`, `bundleId`, `sku`, `primaryLocale` 等 |

**分页与包含**

| 参数 | 说明 |
|------|------|
| `limit` | 每页数量限制 |
| `limit[bundleIdCapabilities]` | Capabilities 关系数量限制 |
| `limit[profiles]` | Profiles 关系数量限制 |
| `include` | 包含关联资源，可选: `profiles`, `bundleIdCapabilities`, `app` |

#### 响应

| 状态码 | 说明 | 响应体 |
|--------|------|--------|
| 200 | 成功 | `BundleIdsResponse` |
| 400 | 请求参数错误 | `ErrorResponse` |
| 401 | 未认证 | `ErrorResponse` |
| 403 | 无权限 | `ErrorResponse` |
| 429 | 请求过于频繁 | `ErrorResponse` |

---

### 2. 注册新的 Bundle ID

```
POST /v1/bundleIds
```

注册一个新的 Bundle ID。

#### 请求体 (BundleIdCreateRequest)

```json
{
  "data": {
    "type": "bundleIds",
    "attributes": {
      "name": "My App Bundle ID",
      "platform": "IOS",
      "identifier": "com.example.myapp",
      "seedId": "XXXXXXXXXX"
    }
  }
}
```

**必填字段:**

| 字段 | 类型 | 说明 |
|------|------|------|
| `attributes.name` | string | **必填** - Bundle ID 显示名称 |
| `attributes.platform` | BundleIdPlatform | **必填** - 平台类型 |
| `attributes.identifier` | string | **必填** - Bundle ID 标识符 |

**可选字段:**

| 字段 | 类型 | 说明 |
|------|------|------|
| `attributes.seedId` | string | 可选 - Team Seed ID（nullable） |

#### 响应

| 状态码 | 说明 | 响应体 |
|--------|------|--------|
| 201 | 创建成功 | `BundleIdResponse` |
| 400 | 请求参数错误 | `ErrorResponse` |
| 401 | 未认证 | `ErrorResponse` |
| 403 | 无权限 | `ErrorResponse` |
| 409 | 资源冲突（已存在） | `ErrorResponse` |
| 422 | 请求体无法处理 | `ErrorResponse` |
| 429 | 请求过于频繁 | `ErrorResponse` |

---

### 3. 获取单个 Bundle ID

```
GET /v1/bundleIds/{id}
```

根据 ID 获取指定的 Bundle ID 信息。

#### 路径参数

| 参数 | 类型 | 说明 |
|------|------|------|
| `id` | string | **必填** - Bundle ID 资源的唯一标识 |

#### 查询参数

| 参数 | 说明 |
|------|------|
| `fields[bundleIds]` | 选择返回的 Bundle ID 字段 |
| `fields[profiles]` | 选择返回的 Profile 字段 |
| `fields[bundleIdCapabilities]` | 选择返回的 Capability 字段 |
| `fields[apps]` | 选择返回的 App 字段 |
| `include` | 包含关联资源: `profiles`, `bundleIdCapabilities`, `app` |
| `limit[bundleIdCapabilities]` | Capabilities 数量限制 |
| `limit[profiles]` | Profiles 数量限制 |

#### 响应

| 状态码 | 说明 | 响应体 |
|--------|------|--------|
| 200 | 成功 | `BundleIdResponse` |
| 400 | 请求参数错误 | `ErrorResponse` |
| 401 | 未认证 | `ErrorResponse` |
| 403 | 无权限 | `ErrorResponse` |
| 404 | 资源不存在 | `ErrorResponse` |
| 429 | 请求过于频繁 | `ErrorResponse` |

---

### 4. 更新 Bundle ID

```
PATCH /v1/bundleIds/{id}
```

更新已有 Bundle ID 的名称。

#### 路径参数

| 参数 | 类型 | 说明 |
|------|------|------|
| `id` | string | **必填** - Bundle ID 资源的唯一标识 |

#### 请求体 (BundleIdUpdateRequest)

```json
{
  "data": {
    "type": "bundleIds",
    "id": "BUNDLE_ID_RESOURCE_ID",
    "attributes": {
      "name": "Updated App Name"
    }
  }
}
```

**可更新字段:**

| 字段 | 类型 | 说明 |
|------|------|------|
| `attributes.name` | string | 可选 - 新的显示名称（nullable） |

> 注意: `platform` 和 `identifier` 字段在创建后不可修改。

#### 响应

| 状态码 | 说明 | 响应体 |
|--------|------|--------|
| 200 | 更新成功 | `BundleIdResponse` |
| 400 | 请求参数错误 | `ErrorResponse` |
| 401 | 未认证 | `ErrorResponse` |
| 403 | 无权限 | `ErrorResponse` |
| 404 | 资源不存在 | `ErrorResponse` |
| 409 | 资源冲突 | `ErrorResponse` |
| 422 | 请求体无法处理 | `ErrorResponse` |
| 429 | 请求过于频繁 | `ErrorResponse` |

---

### 5. 删除 Bundle ID

```
DELETE /v1/bundleIds/{id}
```

删除指定的 Bundle ID。

#### 路径参数

| 参数 | 类型 | 说明 |
|------|------|------|
| `id` | string | **必填** - Bundle ID 资源的唯一标识 |

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

## 关联端点

### 6. 获取 Bundle ID 关联的 App（关系）

```
GET /v1/bundleIds/{id}/relationships/app
```

获取 Bundle ID 与 App 的关联关系 ID。

#### 响应

| 状态码 | 说明 | 响应体 |
|--------|------|--------|
| 200 | 成功 | `BundleIdAppLinkageResponse` |
| 404 | 资源不存在 | `ErrorResponse` |

---

### 7. 获取 Bundle ID 关联的 App（详情）

```
GET /v1/bundleIds/{id}/app
```

获取与 Bundle ID 关联的 App 完整信息。

#### 查询参数

| 参数 | 说明 |
|------|------|
| `fields[apps]` | 选择返回的 App 字段 |

#### 响应

| 状态码 | 说明 | 响应体 |
|--------|------|--------|
| 200 | 成功 | `AppWithoutIncludesResponse` |
| 404 | 资源不存在 | `ErrorResponse` |

---

### 8. 获取 Bundle ID 关联的 Capabilities（关系）

```
GET /v1/bundleIds/{id}/relationships/bundleIdCapabilities
```

获取 Bundle ID 与 Capabilities 的关联关系 ID 列表。

#### 查询参数

| 参数 | 说明 |
|------|------|
| `limit` | 数量限制 |

#### 响应

| 状态码 | 说明 | 响应体 |
|--------|------|--------|
| 200 | 成功 | `BundleIdBundleIdCapabilitiesLinkagesResponse` |
| 404 | 资源不存在 | `ErrorResponse` |

---

### 9. 获取 Bundle ID 关联的 Capabilities（详情）

```
GET /v1/bundleIds/{id}/bundleIdCapabilities
```

获取与 Bundle ID 关联的所有 Capability 完整信息。

#### 查询参数

| 参数 | 说明 |
|------|------|
| `fields[bundleIdCapabilities]` | 选择返回的字段: `capabilityType`, `settings` |
| `limit` | 数量限制 |

#### 响应

| 状态码 | 说明 | 响应体 |
|--------|------|--------|
| 200 | 成功 | `BundleIdCapabilitiesWithoutIncludesResponse` |
| 404 | 资源不存在 | `ErrorResponse` |

---

### 10. 获取 Bundle ID 关联的 Profiles（关系）

```
GET /v1/bundleIds/{id}/relationships/profiles
```

获取 Bundle ID 与 Profiles 的关联关系 ID 列表。

#### 查询参数

| 参数 | 说明 |
|------|------|
| `limit` | 数量限制 |

#### 响应

| 状态码 | 说明 | 响应体 |
|--------|------|--------|
| 200 | 成功 | `BundleIdProfilesLinkagesResponse` |
| 404 | 资源不存在 | `ErrorResponse` |

---

### 11. 获取 Bundle ID 关联的 Profiles（详情）

```
GET /v1/bundleIds/{id}/profiles
```

获取与 Bundle ID 关联的所有 Profile 完整信息。

#### 查询参数

| 参数 | 说明 |
|------|------|
| `fields[profiles]` | 选择返回的字段 |
| `limit` | 数量限制 |

#### 响应

| 状态码 | 说明 | 响应体 |
|--------|------|--------|
| 200 | 成功 | `ProfilesWithoutIncludesResponse` |
| 404 | 资源不存在 | `ErrorResponse` |

---

## 端点汇总

| 方法 | 路径 | 说明 |
|------|------|------|
| `GET` | `/v1/bundleIds` | 列出所有 Bundle IDs |
| `POST` | `/v1/bundleIds` | 注册新 Bundle ID |
| `GET` | `/v1/bundleIds/{id}` | 获取单个 Bundle ID |
| `PATCH` | `/v1/bundleIds/{id}` | 更新 Bundle ID |
| `DELETE` | `/v1/bundleIds/{id}` | 删除 Bundle ID |
| `GET` | `/v1/bundleIds/{id}/relationships/app` | 获取 App 关系 |
| `GET` | `/v1/bundleIds/{id}/app` | 获取关联 App 详情 |
| `GET` | `/v1/bundleIds/{id}/relationships/bundleIdCapabilities` | 获取 Capabilities 关系 |
| `GET` | `/v1/bundleIds/{id}/bundleIdCapabilities` | 获取关联 Capabilities 详情 |
| `GET` | `/v1/bundleIds/{id}/relationships/profiles` | 获取 Profiles 关系 |
| `GET` | `/v1/bundleIds/{id}/profiles` | 获取关联 Profiles 详情 |
