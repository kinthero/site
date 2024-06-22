# kinther's blog

kinther 的个人博客仓库，使用 mkdocs 部署。[网址](https://kinthero.github.io/site/)

## 如何在新电脑继续写博客？

```shell
git clone git@github.com:kinthero/blog.git
cd blog

# 同步python环境
uv venv
.venv\Scripts\Activate
uv pip sync requirements.txt
```

更新完了代码之后，`make` 就可以完成提交和更新
