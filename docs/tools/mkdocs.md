# mkdocs 配置

## 设置字体

mkdocs 设置字体可以参考 [官网文档](https://squidfunk.github.io/mkdocs-material/setup/changing-the-fonts/?h=font#customization)。我用的是霞鹜文楷，但是 Google font 只有一个繁体，对这个提 issue 的人无语。然后霞鹜文楷推荐使用 [ZSFT](https://fonts.zeoseven.com/items/292/)。

修改 mkdocs.yml 文件

```yml
extra_css:
  - stylesheets/extra.css
```

修改 docs/stylesheets/extra.css

```css
@import url("https://fontsapi.zeoseven.com/292/main/result.css");

body {
    font-family: "LXGW WenKai";
    font-weight: normal;
}
```
