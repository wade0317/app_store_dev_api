#!/bin/bash
# 简化的本地安装脚本 - 适用于库 gem 项目

set -e  # 遇到错误立即退出

# 获取当前目录
CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$CURRENT_DIR"

echo "=========================================="
echo "本地构建和安装 Gem"
echo "=========================================="
echo

# 1. 自动检测项目名称
GEMSPEC_FILE=$(find . -maxdepth 1 -name "*.gemspec" | head -n 1)
if [ -z "$GEMSPEC_FILE" ]; then
  echo "❌ 错误: 未找到 .gemspec 文件"
  exit 1
fi

PROJECT_NAME=$(basename "$GEMSPEC_FILE" .gemspec)
echo "项目: $PROJECT_NAME"

# 2. 自动检测版本号
VERSION_FILE=$(find ./lib -name "version.rb" | head -n 1)
if [ -z "$VERSION_FILE" ]; then
  echo "❌ 错误: 未找到 version.rb 文件"
  exit 1
fi

# 提取版本号
VERSION=$(grep -o "VERSION.*=.*['\"][0-9.]*['\"]" "$VERSION_FILE" | sed -E "s/.*['\"]([0-9.]+)['\"].*/\1/")

if [ -z "$VERSION" ]; then
  echo "❌ 错误: 无法解析版本号"
  cat "$VERSION_FILE"
  exit 1
fi

echo "版本: $VERSION"
echo

# 3. 清理旧的 gem 文件
echo "清理旧的 gem 文件..."
rm -f *.gem
echo "✓ 清理完成"
echo

# 4. 构建 gem
echo "构建 gem..."
gem build "$GEMSPEC_FILE"

GEM_FILE="${PROJECT_NAME}-${VERSION}.gem"

if [ ! -f "$GEM_FILE" ]; then
  echo "❌ 错误: gem 构建失败，未找到 $GEM_FILE"
  exit 1
fi

echo "✓ 构建成功: $GEM_FILE"
echo

# 5. 安装到本地
echo "安装到本地..."
gem install "$GEM_FILE"

echo
echo "=========================================="
echo "✅ 安装成功！"
echo "=========================================="
echo
echo "使用方法 (Ruby 代码中):"
echo "  require 'app_store_dev_api'"
echo "  client = AppStoreDevApi::Client.new("
echo "    key_id: 'YOUR_KEY_ID',"
echo "    issuer_id: 'YOUR_ISSUER_ID',"
echo "    private_key: File.read('AuthKey.p8')"
echo "  )"
echo
echo "验证安装:"
echo "  gem list | grep $PROJECT_NAME"
echo "  ruby -r app_store_dev_api -e 'puts AppStoreDevApi::VERSION'"
echo "=========================================="
