#!/bin/bash
# 清理 scripts 目录中的临时文件

echo "=========================================="
echo "清理 scripts 目录"
echo "=========================================="
echo

# 要保留的核心脚本
KEEP_FILES=(
  "validate_requests.rb"
  "comprehensive_validation.rb"
  "test_request_body_classes.rb"
  "find_deprecated_requests.rb"
  "final_validation_report.rb"
  "README.md"
  "cleanup_scripts.sh"
)

cd "$(dirname "$0")"

echo "📋 将保留以下文件："
for file in "${KEEP_FILES[@]}"; do
  echo "  ✓ $file"
done
echo

# 收集要删除的文件
FILES_TO_DELETE=()

for file in *.rb *.json *.sh; do
  if [[ -f "$file" ]]; then
    # 检查是否在保留列表中
    should_keep=false
    for keep in "${KEEP_FILES[@]}"; do
      if [[ "$file" == "$keep" ]]; then
        should_keep=true
        break
      fi
    done

    if [[ "$should_keep" == false ]]; then
      FILES_TO_DELETE+=("$file")
    fi
  fi
done

if [ ${#FILES_TO_DELETE[@]} -eq 0 ]; then
  echo "✅ 没有需要删除的文件"
  exit 0
fi

echo "🗑️  将删除以下文件 (${#FILES_TO_DELETE[@]} 个):"
for file in "${FILES_TO_DELETE[@]}"; do
  echo "  ✗ $file"
done
echo

read -p "确认删除? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  for file in "${FILES_TO_DELETE[@]}"; do
    rm "$file"
    echo "  已删除: $file"
  done
  echo
  echo "✅ 清理完成！"
  echo
  echo "保留的核心工具："
  ls -lh *.rb *.md 2>/dev/null | awk '{print "  " $9 " (" $5 ")"}'
else
  echo "❌ 取消删除"
fi
