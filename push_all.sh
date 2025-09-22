#!/bin/bash
echo "Pushing to GitHub..."
git push origin master
echo "Pushing to Gitee..."
GIT_SSL_NO_VERIFY=true https_proxy="" http_proxy="" git push gitee master
echo "Done!"
