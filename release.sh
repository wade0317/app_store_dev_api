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

gem_files=$(find  $CURRENT_DIR -name "*.gemspec")
for gemspec_file in $gem_files
do

    gem_name=${gemspec_file##*/}
    gem_name=${gem_name%.gemspec}
    # echo $gem_name    

    rm -rf $CURRENT_DIR/*$gem_name-*.gem
    gem build $CURRENT_DIR/$gem_name.gemspec

    GEM_VERSION_FILE=${CURRENT_DIR}/lib/$gem_name/version.rb
    GEM_VERSION_KEY="VERSION"
    TAG_NAME=`grep "[ ].${GEM_VERSION_KEY}[ ]." ${GEM_VERSION_FILE} | cut -d'"' -f2`
    # echo $TAG_NAME

    COMMIT_FILE_LIST=$(git -C $CURRENT_DIR ls-files --other --modified --exclude-standard)
    echo $COMMIT_FILE_LIST

    if [ -z "$COMMIT_FILE_LIST" ]; then
      echo "没有需要提交的文件！"
    else
      git -C $CURRENT_DIR add -A
      git -C $CURRENT_DIR commit -m "add code for ${TAG_NAME}"
      git -C $CURRENT_DIR push
    fi

    if [[ -f $CURRENT_DIR/$gem_name-${TAG_NAME}.gem ]]; then
      gem install --local $CURRENT_DIR/$gem_name-${TAG_NAME}.gem
      gem cleanup
    fi
    # gem push $CURRENT_DIR/$gem_name-${TAG_NAME}.gem
done








