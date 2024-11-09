# windows terminal 设置

安装 [windows terminal](https://learn.microsoft.com/zh-cn/windows/terminal/install)，可以使用命令行直接安装。

```bash
winget install --id Microsoft.WindowsTerminal -e
```

## 打开配置文件

配置都放在 `settings` 中，可以使用快捷键 `ctrl+,` 打开设置，然后点击左下角打开 json 文件。

## 基础配置

```json
"centerOnLaunch": true,
"launchMode": "focus",
"confirmCloseAllTabs": false,
"multiLinePasteWarning": false,
"copyOnSelect": false,
"showTabsInTitlebar": true,
"showTerminalTitleInTitlebar": true,
"tabWidthMode": "equal",
"useAcrylicInTabRow": true
```

## 快捷键配置

快捷键都是在 `actions` 中配置的。

```json
"actions":
[
    ...
],
```

窗口尺寸快捷键，添加之后可以实现

- `alt+enter` 切换全屏模式
- `ctrl+enter` 切换显示标签页
- `shift+enter` 切换最大化窗格

```json
{
    "command": "toggleFocusMode",
    "id": "User.toggleFocusMode",
    "keys": "ctrl+enter"
},
{
    "command": "togglePaneZoom",
    "id": "User.togglePaneZoom",
    "keys": "shift+enter"
},
```

标签页快捷键配置

- `ctrl+shift+num` 可以实现打开不同的新标签页
- `ctrl+o` 选择标签页

```json
{
    "command": "tabSearch",
    "id": "User.tabSearch",
    "keys": "ctrl+o"
},

```

窗格快捷键

- `ctrl+d` 关闭窗格
- `alt+h` 切换到左方窗格
- `alt+l` 切换到右方窗格
- `alt+j` 切换到下方窗格
- `alt+k` 切换到上方窗格

```json
{
    "command": "closePane",
    "keys": "ctrl+d"
},
{
    "command":
    {
        "action": "moveFocus",
        "direction": "down"
    },
    "keys": "alt+j"
},
{
    "command":
    {
        "action": "moveFocus",
        "direction": "up"
    },
    "keys": "alt+k"
},
{
    "command":
    {
        "action": "moveFocus",
        "direction": "left"
    },
    "keys": "alt+h"
},
{
    "command":
    {
        "action": "moveFocus",
        "direction": "right"
    },
    "keys": "alt+l"
},
```
