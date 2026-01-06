# Scripts 目录说明

本目录包含用于维护和验证 AppStoreDevApi 的工具脚本。

## 🔧 核心工具（建议保留）

### 1. `validate_requests.rb` ⭐ 核心验证工具
**用途**: 验证所有 Request 类与 OpenAPI 规范的一致性
**使用场景**:
- API 升级后验证
- 定期检查一致性
- CI/CD 流程集成

**使用方法**:
```bash
ruby scripts/validate_requests.rb
```

### 2. `comprehensive_validation.rb` ⭐ 全面验证工具
**用途**: 三方交叉验证（schema.json ↔ Request 类 ↔ OpenAPI）
**使用场景**:
- 重大更新后的全面检查
- 发布前验证

**使用方法**:
```bash
ruby scripts/comprehensive_validation.rb
```

### 3. `test_request_body_classes.rb` ⭐ 功能测试
**用途**: 测试 Request Body 类的功能是否正常
**使用场景**:
- 修改核心代码后测试
- 回归测试

**使用方法**:
```bash
ruby scripts/test_request_body_classes.rb
```

### 4. `find_deprecated_requests.rb` ⭐ 废弃检测工具
**用途**: 查找代码库中不在 OpenAPI 规范中的废弃接口
**使用场景**:
- OpenAPI 规范更新后
- 定期清理

**使用方法**:
```bash
ruby scripts/find_deprecated_requests.rb
```

## 🛠️ 一次性工具（可以删除）

### 修复和分析工具
这些脚本用于一次性修复问题，完成后可以删除：

- `fix_requests.rb` - 自动修复工具（已完成使用）
- `analyze_deprecated.rb` - 废弃接口分析（已完成使用）
- `check_naming_conflicts.rb` - 命名冲突检查（已完成使用）

### 代码生成工具
这些是早期开发使用的工具，可以删除：

- `generate_request_body_classes.rb`
- `generate_smart_schema.rb`
- `generate_smart_schema_v2.rb`
- `openapi_to_schema.rb`

### 分析和对比工具
一次性分析工具，可以删除：

- `analyze_alias_changes.rb`
- `analyze_request_body_coverage.rb`
- `architecture_compatibility_test.rb`
- `check_missing_endpoints.rb`
- `check_request_body_types.rb`
- `compare_schemas.rb`
- `compare_types.rb`
- `comprehensive_code_review.rb`
- `comprehensive_uniqueness_check.rb`
- `deep_validation.rb`
- `detailed_compatibility_check.rb`
- `detect_duplicate_aliases.rb`
- `extract_naming_rules.rb`
- `list_alias_changes.rb`
- `verify_compatibility.rb`
- `verify_all_requests.rb`

## 📄 报告文件（可以删除）

所有 JSON 报告文件都是临时生成的，可以删除：

- `validation_report.json`
- `comprehensive_validation_report.json`
- `deprecated_requests.json`
- `deprecated_analysis.json`
- `validation_certificate.json`

如果需要，这些文件可以通过运行对应的脚本重新生成。

## 📋 最终清理方案

### 建议保留（4个核心脚本）
```
scripts/
├── validate_requests.rb              # API 一致性验证
├── comprehensive_validation.rb       # 三方交叉验证
├── test_request_body_classes.rb     # 功能测试
├── find_deprecated_requests.rb      # 废弃检测
└── README.md                        # 本说明文件
```

### 可以删除的文件
- 所有其他 .rb 脚本（30+ 个）
- 所有 .json 报告文件（5+ 个）

## 🔄 未来维护

当 Apple 发布新的 API 版本时：

1. 更新 `docs/openapi.oas{version}.json`
2. 运行 `validate_requests.rb` 检查不一致
3. 运行 `find_deprecated_requests.rb` 查找废弃接口
4. 修复发现的问题
5. 运行 `comprehensive_validation.rb` 全面验证
6. 运行 `test_request_body_classes.rb` 确保功能正常
