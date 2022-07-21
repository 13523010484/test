#!/usr/bin/env sh

# 当发生错误时中止脚本
set -e
# 构建
npm run build
git add .
git commit -m "deploy"
git push origin main
git subtree push --prefix dist origin gh-pages
# cd -