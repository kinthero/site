# vscode python 配置

需要安装的插件：

- ms-python.python
- ms-python.black-formatter
- ms-python.autopep8
- charliermarsh.ruff

安装插件的方法：

- 按住`ctrl+p`
- 输入`ext install 插件名`
- 回车

打开 vscode 的`settings.json`文件，可以直接输入`ctrl+shift+p`查找，添加下面的配置
实现的功能是：

- 使用 black-formatter 进行格式化，也可以设置为 autopep8
- 代码保存的时候自动格式化
- 基于 ruff 实现一些修复

```json
"[python]": {
  "editor.defaultFormatter": "ms-python.black-formatter",
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": true
  },
}
```
