# vscode vim 配置

## 完整的 vim 配置

<details>
<summary>settings.json</summary>

```json
  // vim settings
  "vim.leader": "<Space>",
  "vim.smartRelativeLine": true,
  "vim.useSystemClipboard": true,
  "vim.foldfix": true,
  "vim.hlsearch": true,
  "vim.autoSwitchInputMethod.enable": false,
  "vim.autoSwitchInputMethod.defaultIM": "1033",
  "vim.autoSwitchInputMethod.obtainIMCmd": "C:\\Users\\kilos\\app\\im-select.exe",
  "vim.autoSwitchInputMethod.switchIMCmd": "C:\\Users\\kilos\\app\\im-select.exe {im}",
  "vim.highlightedyank.enable": true,
  "vim.highlightedyank.color": "#a9dc7660",
  "vim.highlightedyank.duration": 250,
  "vim.handleKeys": {
    "<C-k>": false,
    "<C-b>": false,
    "<C-j>": false,
    "<C-z>": false,
    "<C-s>": false,
    "<C-v>": false
  },
  "vim.insertModeKeyBindingsNonRecursive": [
    {
      "before": ["j", "k"],
      "after": ["<Esc>"]
    }
  ],
  "vim.normalModeKeyBindingsNonRecursive": [
    {
      "before": ["<leader>", "space"],
      "commands": ["workbench.action.quickOpen"]
    },
    {
      "before": ["<leader>", ","],
      "commands": ["workbench.action.showAllEditors"]
    },
    {
      "before": ["<leader>", "e"],
      "commands": ["workbench.view.explorer"]
    },
    {
      "before": ["<leader>", "c", "a"],
      "commands": ["editor.action.codeAction"]
    },
    {
      "before": ["<leader>", "c", "r"],
      "commands": ["editor.action.rename"]
    },
    {
      "before": ["<leader>", "c", "s"],
      "commands": ["editor.action.gotoSymbol"]
    },
    {
      "before": ["<leader>", "b", "d"],
      "commands": ["workbench.action.closeActiveEditor"]
    },
    {
      "before": ["<leader>", "t", "o"],
      "commands": [":tabonly"]
    },
    {
      "before": ["<leader>", "v", "s"],
      "commands": ["workbench.action.editorLayoutSingle"]
    },
    {
      "before": ["<leader>", "v", "l"],
      "commands": ["workbench.action.moveEditorToRightGroup"]
    },
    {
      "before": ["<leader>", "v", "h"],
      "commands": ["workbench.action.moveEditorToLeftGroup"]
    },
    // UI
    {
      "before": ["<leader>", "u", "c"],
      "commands": ["workbench.action.toggleCenteredLayout"]
    },
    {
      "before": ["<leader>", "u", "s"],
      "commands": ["settings.cycle.statusBar"]
    },
    {
      "before": ["<leader>", "u", "b"],
      "commands": ["settings.cycle.breadcrumbs"]
    },
    {
      "before": ["<leader>", "u", "l"],
      "commands": ["settings.cycle.lineNumbers"]
    },
    {
      "before": ["<leader>", "u", "g"],
      "commands": ["settings.cycle.glyphMargin"]
    },
    {
      "before": ["<leader>", "u", "t"],
      "commands": ["settings.cycle.showTabs"]
    },
    // functional
    {
      // execute python file
      "before": ["<leader>", "c", "e"],
      "commands": ["python.execInTerminal"]
    },
    // personal habit
    {
      // reundo
      "before": ["U"],
      "commands": ["<C-r>"]
    },
    {
      // save file
      "before": ["<leader>", "w"],
      "commands": ["workbench.action.files.save"]
    },
    {
      // close file
      "before": ["<leader>", "q"],
      "commands": ["workbench.action.closeActiveEditor"]
    },
    // Jump
    {
      "before": ["g", "p", "d"],
      "commands": ["editor.action.peekDefinition"]
    },
    {
      "before": ["g", "h"],
      "commands": ["editor.action.showDefinitionPreviewHover"]
    },
    {
      "before": ["g", "i"],
      "commands": ["editor.action.goToImplementation"]
    },
    {
      "before": ["g", "p", "i"],
      "commands": ["editor.action.peekImplementation"]
    },
    {
      "before": ["g", "q"],
      "commands": ["editor.action.quickFix"]
    },
    {
      "before": ["g", "r"],
      "commands": ["editor.action.referenceSearch.trigger"]
    },
    {
      "before": ["g", "t"],
      "commands": ["editor.action.goToTypeDefinition"]
    },
    {
      "before": ["g", "p", "t"],
      "commands": ["editor.action.peekTypeDefinition"]
    },
    {
      "before": ["j"],
      "after": ["g", "j"]
    },
    {
      "before": ["k"],
      "after": ["g", "k"]
    },
    {
      "before": ["J"],
      "after": ["]", "m", "z", "t"]
    },
    {
      "before": ["K"],
      "after": ["[", "m", "z", "t"]
    },
    // group control
    {
      "before": ["H"],
      "commands": [":tabp"]
    },
    {
      "before": ["L"],
      "commands": [":tabn"]
    }
  ],
```

</details>

## vim 配置

需要安装的插件`vscodevim.vim`有需要可以安装`vintharas.learn-vim`学习一下。

在`keybindings.json`中添加这个，输入`:`命令的时候，会在在上面以命令面板的方式显示，可能有BUG，先不用。

```json
{
"key": "shift+;",
"command": "vim.showQuickpickCmdLine",
"when": "editorTextFocus && vim.mode != 'Insert'"
},
```

vim 中有一些插件功能可以开启，在`settings.json`开启的部分功能如下：

- 将 leader 按键设为空格，默认为`\`
- 使用系统剪切板
- 解决 jk 移动的时候折叠的代码自动展开的问题
- 查找结果保持高亮

```json
{
"vim.leader": "<space>",
"vim.useSystemClipboard": true,
"vim.foldfix": true,
"vim.hlsearch": true,
},
```

vim 的案件配置有几种

- vim.insertModeKeyBindings - 插入模式按键绑定
- vim.normalModeKeyBindings - 普通模式按键绑定
- vim.visualModeKeyBindings - 视图模式按键绑定
- vim.operatorPendingModeKeyBindings - 算子模式按键绑定
  以及非递归形式，就是防止 i 改成 j，j 改成 i 这种情况后出现 ijijij 递归执行的情况
- vim.insertModeKeyBindingsNonRecursive
- normalModeKeyBindingsNonRecursive
- visualModeKeyBindingsNonRecursive
- operatorPendingModeKeyBindingsNonRecursive

首先配置插入模式下退出的按键，将`jk`改成退出插入模式

```json
"vim.insertModeKeyBindingsNonRecursive": [
{
"before": [ "j", "k" ],
"after": [ "<ESC>" ]
}
],
```

后面的配置都是在`vim.normalModeKeyBindingsNonRecursive`设置的，
更改一些按键习惯，让使用更加舒适

```json
{
  // reundo
  "before": ["U"],
  "commands": ["<C-r>"],
},
{
  // split line, correspond to J for join line
  "before": ["K"],
  "commands": ["lineBreakInsert"],
  "silent": true
},
  {
  // save file
  "before": ["<leader>", "w"],
  "commands": ["workbench.action.files.save"]
},
{
  // close file
  "before": ["<leader>", "q"],
  "commands": ["workbench.action.closeActiveEditor"]
},
{
  // no highlight
  "before": ["<leader>", "/"],
  "commands": [":noh"]
},
```

文件跳转和命令面板等功能

- 打开命令行
- 打开文件
- 打开 buffer
- 跳到函数

```json
{
// show command line
"before": ["<leader>", "p"],
"commands": ["workbench.action.showCommands"]
},
{
// go to file
"before": ["<leader>", "f"],
"commands": ["workbench.action.quickOpen"]
},
{
// go to buffer
"before": ["<leader>", "b"],
"commands": ["workbench.action.showAllEditors"]
},
{
// go to symbol
"before": ["<leader>", "o"],
"commands": ["workbench.action.gotoSymbol"]
}
```

窗格跳转，实现窗格的左右跳转，因为我不用上下，

- 命令行面板使用 ctrl+j
- 左边活动栏使用 ctrl+b

```json
{
// move to left group
"before": ["<C-h>"],
"after": ["<C-w>", "h"]
},
{
// move to right group
"before": ["<C-l>"],
"after": ["<C-w>", "l"]
},
```
