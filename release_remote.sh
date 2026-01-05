#!/bin/bash

#当前脚本目录
CURRENT_DIR=$(dirname $(readlink -f $0))
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
  VALUE=$(grep -m 1 -o "^[ ]*$KEY[ ]*=[ ]*[\"]*.*[\"]*" $File | sed -e "s/^[ ]*$KEY[ ]*=[ ]*[\"]*//" -e "s/[\"]*$//")VALUE=$(grep -m 1 -o "^[ ]*$KEY[ ]*=[ ]*[\"]*.*[\"]*" $File | sed -e "s/^[ ]*$KEY[ ]*=[ ]*[\"]*//" -e "s/[\"]*$//")
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

VERSION_KEY="VERSION"
VERSION_TAG_NAME=$(grep -o "${VERSION_KEY}.*=.*['\"]\(.*\)['\"]" ${VERSION_FILE} | head -1 | sed -E "s/.*['\"]([0-9]+\.[0-9]+\.[0-9]+)['\"].*/\1/")
TAG_NAME="v${VERSION_TAG_NAME}"

COMMIT_FILE_LIST=$(git -C $CURRENT_DIR ls-files --other --modified --exclude-standard)
echo $COMMIT_FILE_LIST

if [ -z "$COMMIT_FILE_LIST" ]; then
  echo "没有需要提交的文件！"
else
  echo "提交没有提交的文件！"
  # $(git -C $CURRENT_DIR ls-files --other --modified --exclude-standard)
  git -C $CURRENT_DIR add -A
  git -C $CURRENT_DIR commit -m "res ${VERSION_TAG_NAME}"
  git -C $CURRENT_DIR push
fi



#合并到master分支
RELEASE_BRANCH="master"
CODING_BRANCH=$(git -C $CURRENT_DIR rev-parse --abbrev-ref HEAD)

if [[ "$CODING_BRANCH" == "$RELEASE_BRANCH" ]]; then
  echo "在master分支不需要处理"
else
  git -C $CURRENT_DIR checkout $RELEASE_BRANCH
  git -C $CURRENT_DIR merge $CODING_BRANCH
  git -C $CURRENT_DIR push

  git -C $CURRENT_DIR checkout $CODING_BRANCH
  git -C $CURRENT_DIR merge $RELEASE_BRANCH
  git -C $CURRENT_DIR push
  
fi



gem build $GEMSPEC_FILE
if [[ -f $CURRENT_DIR/${PROJECT_NAME}-${VERSION_TAG_NAME}.gem ]]; then
  gem install --local $CURRENT_DIR/${PROJECT_NAME}-${VERSION_TAG_NAME}.gem
fi


#添加tag
git -C $CURRENT_DIR checkout $RELEASE_BRANCH
EXIST_LOCAL_TAG=$(git -C $CURRENT_DIR tag --list ${TAG_NAME})
if [ -z "$EXIST_LOCAL_TAG" ]; then
  #statements
  echo "无本地tag:${TAG_NAME}"
else

  echo "删除本地tag:${TAG_NAME}"
  git -C $CURRENT_DIR tag -d ${TAG_NAME}
fi

REMOTE_EXIST_TAG=$(git -C $CURRENT_DIR ls-remote --tags origin "refs/tags/${TAG_NAME}")
if [ -z "$REMOTE_EXIST_TAG" ]; then
  #statements
  echo "无远程tag:${TAG_NAME}"
else

  DELETE_REMOTE_TAG=""
  read -p "存在远程分支,确认要删除远程分支吗？[Y/n]: " DELETE_REMOTE_TAG
  case "${DELETE_REMOTE_TAG}" in
  [yY][eE][sS] | [yY])
      echo "删除远程tag:${TAG_NAME}"
      git -C $CURRENT_DIR push origin :${TAG_NAME}
      ;;
  # [nN][oO] | [nN])
  #     echo "exit!"
  #     exit 1
  #     ;;
  *)
      echo "Exit!"
      exit 1
      ;;
  esac  
fi

git -C $CURRENT_DIR tag  ${TAG_NAME}
git -C $CURRENT_DIR push origin ${TAG_NAME}
git -C $CURRENT_DIR checkout $CODING_BRANCH


if [[ -f $CURRENT_DIR/${PROJECT_NAME}-${VERSION_TAG_NAME}.gem ]]; then
  gem push $CURRENT_DIR/${PROJECT_NAME}-${VERSION_TAG_NAME}.gem
fi








