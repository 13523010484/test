#!/usr/bin/env sh

# 当发生错误时中止脚本
set -e

# 构建
# npm install
npm run build

# 将源代码及构建代码提交值main分支
# git add .
# git commit -m "main提交"
# git push origin main

# cd 到构建输出的目录下
cd dist

# 部署到自定义域域名
# echo 'www.example.com' > CNAME

# git init && git init的默认分支master改为main
git init -b main
git add -A
git commit -m 'deploy'

# 部署到 https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# 部署到 https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:13523010484/test.git main:gh-pages

cd -