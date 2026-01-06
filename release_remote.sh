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


rm -rf $CURRENT_DIR/*app_store_dev_api-*.gem

VERSION_FILE=${CURRENT_DIR}/lib/app_store_dev_api/version.rb
VERSION_TAG_NAME=$(grep VERSION ${VERSION_FILE} | cut -d"'" -f2)
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
  # 1. 同步远程仓库
  echo "同步远程仓库..."
  git -C $CURRENT_DIR fetch origin

  # 2. 检查 coding_branch 的本地和远程状态
  echo "检查 ${CODING_BRANCH} 分支状态..."
  LOCAL_COMMIT=$(git -C $CURRENT_DIR rev-parse $CODING_BRANCH)
  REMOTE_COMMIT=$(git -C $CURRENT_DIR rev-parse origin/$CODING_BRANCH 2>/dev/null || echo "")

  if [ -n "$REMOTE_COMMIT" ]; then
    if [ "$LOCAL_COMMIT" != "$REMOTE_COMMIT" ]; then
      # 检查是否本地领先或落后
      AHEAD=$(git -C $CURRENT_DIR rev-list --count origin/$CODING_BRANCH..$CODING_BRANCH)
      BEHIND=$(git -C $CURRENT_DIR rev-list --count $CODING_BRANCH..origin/$CODING_BRANCH)

      if [ "$AHEAD" -gt 0 ] && [ "$BEHIND" -gt 0 ]; then
        echo "错误: ${CODING_BRANCH} 分支本地和远程已分叉，请手动处理"
        exit 1
      elif [ "$BEHIND" -gt 0 ]; then
        echo "本地分支落后远程，正在同步..."
        git -C $CURRENT_DIR pull origin $CODING_BRANCH
      fi
      # 如果本地领先，后面 push 会处理
    fi
  fi

  # 3. 双向合并，确保两个分支同步到同一节点
  echo "合并 ${CODING_BRANCH} 到 ${RELEASE_BRANCH}..."
  git -C $CURRENT_DIR checkout $RELEASE_BRANCH
  git -C $CURRENT_DIR pull origin $RELEASE_BRANCH || true  # 先同步 release_branch
  git -C $CURRENT_DIR merge $CODING_BRANCH
  git -C $CURRENT_DIR push

  echo "同步 ${RELEASE_BRANCH} 回 ${CODING_BRANCH}..."
  git -C $CURRENT_DIR checkout $CODING_BRANCH
  # 使用 --ff-only 确保是 fast-forward 合并（两分支应该在同一节点）
  if ! git -C $CURRENT_DIR merge $RELEASE_BRANCH --ff-only; then
    echo "错误: 无法 fast-forward 合并，分支状态异常"
    exit 1
  fi
  git -C $CURRENT_DIR push

  echo "分支合并完成，${CODING_BRANCH} 和 ${RELEASE_BRANCH} 已同步到同一节点"
fi



gem build $CURRENT_DIR/app_store_dev_api.gemspec
if [[ -f $CURRENT_DIR/app_store_dev_api-${VERSION_TAG_NAME}.gem ]]; then
  gem install --local $CURRENT_DIR/app_store_dev_api-${VERSION_TAG_NAME}.gem
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


if [[ -f $CURRENT_DIR/app_store_dev_api-${VERSION_TAG_NAME}.gem ]]; then
  gem push $CURRENT_DIR/app_store_dev_api-${VERSION_TAG_NAME}.gem
fi








