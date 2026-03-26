# Changelog

所有对本项目的显著更改都将记录在此文件中。

格式基于 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，
并且本项目遵循 [语义化版本](https://semver.org/lang/zh-CN/)。

## [Unreleased]

### Fixed
- 修复所有 Request 类与 Apple App Store Connect API v4.2 规范的不一致问题
- 修复 68 个接口的属性和关系命名规范（从下划线命名改为驼峰命名）
- 修复 `Attributes` 类中布尔值验证bug（false值被误判为缺失）
- 修复 `Relationships` 类中布尔值验证bug（false值被误判为缺失）

### Changed
- API 规范一致性从 72.2% 提升到 100%
- 规范化所有属性和关系命名为驼峰命名（camelCase）
- 更新所有 Request 类以匹配 OpenAPI v4.2 规范

### Added
- 新增 160+ 个 Request 类文件（覆盖 API v4.2 新增功能）
- 新增 `Relationships` 对象类
- 新增验证工具 `scripts/validate_requests.rb`
- 新增自动修复工具 `scripts/fix_requests.rb`
- 新增 Request Body 功能测试

### Technical Details

**修复的主要问题类别：**
1. **属性命名规范化**（~150处）
   - `available_in_new_territories` → `availableInNewTerritories`
   - `contact_email` → `contactEmail`
   - `whats_new` → `whatsNew`

2. **新增缺失属性**（~80处）
   - AccessibilityDeclaration: 新增 9个无障碍功能属性
   - Webhook: 新增 `eventTypes`, `secret`
   - AgeRatingDeclaration: 新增 12个分级相关属性

3. **移除过时属性**（~70处）
   - AppEvent: 移除 `eventState`
   - AppEncryptionDeclaration: 移除 7个过时属性

4. **关系命名规范化**（~20处）
   - `app_store_version` → `appStoreVersion`
   - `app_clip_default_experience` → `appClipDefaultExperience`

**影响的文件：**
- 68 个已存在的 Request 类（修复）
- 160+ 个新增的 Request 类
- 2 个核心对象类（Attributes, Relationships）
- 1 个测试文件
- 2 个新增工具脚本

**测试结果：**
- ✅ 所有 Request Body 测试通过 (6/6)
- ✅ API 一致性验证通过 (241/241)

## [历史版本]

（以前的版本历史可以在 git log 中查看）
