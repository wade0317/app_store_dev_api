#!/bin/bash

#当前脚本目录 (macOS兼容)
if [[ "$OSTYPE" == "darwin"* ]]; then
  CURRENT_DIR=$(dirname $(greadlink -f $0 2>/dev/null || readlink $0 2>/dev/null || echo $0))
else
  CURRENT_DIR=$(dirname $(readlink -f $0))
fi
CURRENT_DIR=$(cd "$CURRENT_DIR" && pwd)
echo $CURRENT_DIR


# Make all files and directories in the current directory readable, writable, and executable for all users.
/bin/chmod -R a+rwx $CURRENT_DIR
# Change the owner of the current directory to the current user.
/usr/sbin/chown $(whoami) $CURRENT_DIR
# Change the group of the current directory to "admin".
/usr/bin/chgrp admin $CURRENT_DIR

function readConfigValue()
{
  File=$1
  KEY=$2
  VALUE=$(grep -m 1 -o "^[ ]*$KEY[ ]*=[ ]*[\"]*.*[\"]*" $File | sed -e "s/^[ ]*$KEY[ ]*=[ ]*[\"]*//" -e "s/[\"]*$//")
  echo $VALUE
}


# 自动检测当前项目名称
GEMSPEC_FILE=$(find $CURRENT_DIR -maxdepth 1 -name "*.gemspec" | head -n 1)
if [ -z "$GEMSPEC_FILE" ]; then
  echo "错误: 未找到gemspec文件!"
  exit 1
fi

# 从gemspec文件名获取项目名称
PROJECT_NAME=$(basename $GEMSPEC_FILE .gemspec)
echo "检测到项目: $PROJECT_NAME"

# 清理旧的gem文件
rm -rf $CURRENT_DIR/*${PROJECT_NAME}-*.gem

# 自动检测版本文件
VERSION_FILE=$(find $CURRENT_DIR/lib -name "version.rb" | head -n 1)
if [ -z "$VERSION_FILE" ]; then
  echo "错误: 未找到version.rb文件!"
  exit 1
fi

echo "检测到版本文件: $VERSION_FILE"
VERSION_KEY="VERSION"
# 改进版本号提取方式，确保只获取版本号部分
VERSION_TAG_NAME=$(grep -o "${VERSION_KEY}.*=.*['\"]\(.*\)['\"]" ${VERSION_FILE} | head -1 | sed -E "s/.*['\"]([0-9]+\.[0-9]+\.[0-9]+)['\"].*/\1/")
echo "检测到版本: $VERSION_TAG_NAME"

# 验证版本号格式
if [[ ! $VERSION_TAG_NAME =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "错误: 无法正确解析版本号，获取到的值: '$VERSION_TAG_NAME'"
  echo "直接查看版本文件内容:"
  cat $VERSION_FILE
  exit 1
fi


# 构建和安装gem
echo "构建 $PROJECT_NAME gem..."
gem build $GEMSPEC_FILE

# 查找生成的gem文件（在当前目录和CURRENT_DIR中查找）
GEM_FILE=$(find . -maxdepth 1 -name "${PROJECT_NAME}-${VERSION_TAG_NAME}.gem" | head -n 1)
if [ -z "$GEM_FILE" ]; then
  GEM_FILE=$(find $CURRENT_DIR -maxdepth 1 -name "${PROJECT_NAME}-${VERSION_TAG_NAME}.gem" | head -n 1)
fi

if [ -n "$GEM_FILE" ]; then
  echo "找到gem文件: $GEM_FILE"
  echo "安装 $PROJECT_NAME-${VERSION_TAG_NAME}.gem..."
  gem install --local "$GEM_FILE"
else
  echo "错误: 未找到生成的gem文件! 尝试查找任何版本的gem..."
  ANY_GEM=$(find . -maxdepth 1 -name "${PROJECT_NAME}-*.gem" | head -n 1)
  if [ -n "$ANY_GEM" ]; then
    echo "找到gem文件: $ANY_GEM"
    echo "安装 $ANY_GEM..."
    gem install --local "$ANY_GEM"
  else
    echo "未找到任何${PROJECT_NAME}的gem文件"
  fi
fi






