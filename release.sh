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


rm -rf $CURRENT_DIR/*app_store_dev_api-*.gem
gem build $CURRENT_DIR/app_store_dev_api.gemspec

GEM_VERSION_FILE=${CURRENT_DIR}/lib/app_store_dev_api/version.rb
GEM_VERSION_KEY="VERSION"
TAG_NAME=`grep "[ ].${GEM_VERSION_KEY}[ ]." ${GEM_VERSION_FILE} | cut -d'"' -f2`

COMMIT_FILE_LIST=$(git -C $CURRENT_DIR ls-files --other --modified --exclude-standard)
echo $COMMIT_FILE_LIST

if [ -z "$COMMIT_FILE_LIST" ]; then
  echo "没有需要提交的文件！"
else
  echo "111"
  # $(git -C $CURRENT_DIR ls-files --other --modified --exclude-standard)
  git -C $CURRENT_DIR add -A
  git -C $CURRENT_DIR commit -m "add code for ${TAG_NAME}"
  git -C $CURRENT_DIR push
fi

if [[ -f $CURRENT_DIR/app_store_dev_api-${TAG_NAME}.gem ]]; then
  gem install --local $CURRENT_DIR/app_store_dev_api-${TAG_NAME}.gem
  gem cleanup
fi

# #合并到master分支
# RELEASE_BRANCH="master"
# CODING_BRANCH=$(git -C $CURRENT_DIR rev-parse --abbrev-ref HEAD)

# if [[ "$CODING_BRANCH" == "$RELEASE_BRANCH" ]]; then
#   echo "在master分支不需要处理"
# else
#   git -C $CURRENT_DIR checkout $RELEASE_BRANCH
#   git -C $CURRENT_DIR merge $CODING_BRANCH
#   git -C $CURRENT_DIR push
#   git -C $CURRENT_DIR checkout $CODING_BRANCH
# fi

# #添加tag
# EXIST_LOCAL_TAG=$(git -C $CURRENT_DIR tag --list ${TAG_NAME})
# if [ -z "$EXIST_LOCAL_TAG" ]; then
#   #statements
#   echo "无本地tag:${TAG_NAME}"
# else

#   echo "删除本地tag:${TAG_NAME}"
#   git -C $CURRENT_DIR tag -d ${TAG_NAME}
# fi

# REMOTE_EXIST_TAG=$(git -C $CURRENT_DIR ls-remote --tags origin "refs/tags/${TAG_NAME}")
# if [ -z "$REMOTE_EXIST_TAG" ]; then
#   #statements
#   echo "无远程tag:${TAG_NAME}"
# else

#   DELETE_REMOTE_TAG=""
#   read -p "存在远程分支,确认要删除远程分支吗？[Y/n]: " DELETE_REMOTE_TAG
#   case "${DELETE_REMOTE_TAG}" in
#   [yY][eE][sS] | [yY])
#       echo "删除远程tag:${TAG_NAME}"
#       git -C $CURRENT_DIR push origin :${TAG_NAME}
#       ;;
#   # [nN][oO] | [nN])
#   #     echo "exit!"
#   #     exit 1
#   #     ;;
#   *)
#       echo "Exit!"
#       exit 1
#       ;;
#   esac  
# fi

# git -C $CURRENT_DIR tag ${TAG_NAME}
# git -C $CURRENT_DIR push origin ${TAG_NAME}

# gem push $CURRENT_DIR/app_store_dev_api-${TAG_NAME}.gem








