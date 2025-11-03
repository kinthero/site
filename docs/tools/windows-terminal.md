# Windows terminal 设置

安装 [Windows terminal](https://learn.microsoft.com/zh-cn/windows/terminal/install)，可以使用命令行直接安装。

```bash
winget install --id Microsoft.WindowsTerminal -e
```

## 打开配置文件

配置都放在 `settings` 中，可以使用快捷键 `ctrl+,` 打开设置，然后点击左下角打开 JSON 文件。

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


```json
"actions": 
[
    {
        "command": "toggleFocusMode",
        "id": "User.toggleFocusMode"
    },
    {
        "command": "togglePaneZoom",
        "id": "User.togglePaneZoom"
    }
],
"keybindings": 
[
    {
        "id": "User.toggleFocusMode",
        "keys": "ctrl+enter"
    },
    {
        "id": "User.togglePaneZoom",
        "keys": "shift+enter"
    },
    {
        "id": "Terminal.MoveFocusLeft",
        "keys": "alt+h"
    },
    {
        "id": "Terminal.MoveFocusRight",
        "keys": "alt+l"
    },
    {
        "id": "Terminal.MoveFocusUp",
        "keys": "alt+k"
    },
    {
        "id": "Terminal.MoveFocusDown",
        "keys": "alt+j"
    }
],
```

实现的功能:

- `alt+enter` 切换全屏模式
- `ctrl+enter` 切换显示标签页
- `shift+enter` 切换最大化窗格
- `ctrl+d` 关闭窗格
- `alt+h` 切换到左方窗格
- `alt+l` 切换到右方窗格
- `alt+j` 切换到下方窗格
- `alt+k` 切换到上方窗格


~~标签页快捷键配置~~

- `ctrl+shift+num` 可以实现打开不同的新标签页
- `ctrl+o` 选择标签页

```json
{
    "command": "tabSearch",
    "id": "User.tabSearch",
    "keys": "ctrl+o"
},

```

## 设置 profile

```powershell
$env:EDITOR = 'vim'

# use emacs keybinding
Set-PSReadLineOption -EditMode Emacs

# scoop search
. ([ScriptBlock]::Create((& scoop-search --hook | Out-String)))

# starship
Invoke-Expression (&starship init powershell)

# zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# psfzf
# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
# example command - use $Location with a different command:
$commandOverride = [ScriptBlock]{ param($Location) Write-Host $Location }
# pass your override to PSFzf:
Set-PsFzfOption -AltCCommand $commandOverride
# tab
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }


# alias
Set-Alias -Name ls -Value "eza"
New-Alias -Name av -Value '.\.venv\Scripts\Activate.ps1'
New-Alias -Name dav -Value 'deactivate'

#---------------------------------------------------------------------------------------- 
function proxy {
    param([string]$Action)
    
    $proxyUrl = "http://127.0.0.1:7890"

    switch ($Action) {
        "on" {
            $env:HTTP_PROXY = $proxyUrl
            $env:HTTPS_PROXY = $proxyUrl
            Write-Host "✅ 代理已启用" -ForegroundColor Green
        }
        "off" {
            $env:HTTP_PROXY = $null
            $env:HTTPS_PROXY = $null
            Write-Host "🛑 代理已禁用" -ForegroundColor Yellow
        }
        "status" {
            if ($env:HTTP_PROXY) {
                Write-Host "🌐 代理：$env:HTTP_PROXY" -ForegroundColor Cyan
            } else {
                Write-Host "⚪ 代理未启用" -ForegroundColor Gray
            }
        }
        default {
            Write-Host "proxy [on|off|status]" -ForegroundColor Gray
        }
    }
}
```

## 其他

使用宝可梦风格的背景

```shell
pipx install git+https://github.com/LazoCoder/Pokemon-Terminal.git
```
