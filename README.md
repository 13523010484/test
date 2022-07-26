# hello-world

## Project setup
```
yarn install
```

### Compiles and hot-reloads for development
```
yarn serve
```

### Compiles and minifies for production
```
yarn build
```

### Lints and fixes files
```
yarn lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

### vue github pages demo
1、github新建一个仓库地址test
2、本地拉取test仓库的代码，若拉取失败，可能是github当中为添加本地git的ssh导致，添加过之后就可以进行pull，push操作。
3、在本地创建一个vue-cli项目，在根目录下创建vue.config.js文件，修改publicPath的资源路径，目的解决部署之后资源路径无法访问到导致的404问题，具体参考vue cli官方文档：https://cli.vuejs.org/zh/guide/deployment.html#github-pages
```
module.exports = {
  publicPath: process.env.NODE_ENV === 'production'
    ? '/my-project/'// 仓库名，例如本示例当中的仓库名是test
    : '/'
}
```
4、npm run build打包，修改.gitignore文件，将dist忽略文件注释掉，以便改变可以提交。
5、提交代码到main主分支及gh-pages分支
```
git add .
git commit -m "提交值主分支"
git push origin master

// 将代码提交至主分支后，然后创建gf-pages子分支，将dist文件提交至子分支
git subtree push --prefix dist origin gh-pages
```

### 使用自动化部署 参考文档https://cli.vuejs.org/zh/guide/deployment.html#%E4%BA%91%E5%BC%80%E5%8F%91-cloudbase github pages deploy.sh文件
```
#!/usr/bin/env sh

# 当发生错误时中止脚本
set -e

# 构建
npm run build

# cd 到构建输出的目录下
cd dist

# 部署到自定义域域名
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# 部署到 https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# 部署到 https://<USERNAME>.github.io/<REPO>
# git push -f git@github.com:<USERNAME>/<REPO>.git master:gh-pages

cd -
```
