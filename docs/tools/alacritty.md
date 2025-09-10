# alacritty 设置

alacritty 的配置文件的路径

Linux
- $XDG_CONFIG_HOME/alacritty/alacritty.toml
- $XDG_CONFIG_HOME/alacritty.toml
- $HOME/.config/alacritty/alacritty.toml
- $HOME/.alacritty.toml

Windows
- %APPDATA%\alacritty\alacritty.toml

安装主题 catppuccin

```bash
curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-frappe.toml
```


配置文件

```toml
[general]
import = [
  "~/.config/alacritty/catppuccin-frappe.toml"
]
live_config_reload = true

[window]
opacity = 0.85

[font]
normal = { family = "FiraCode Nerd Font Mono", style="Regular" }
size = 14

[selection]
save_to_clipboard = true

[cursor]
style = { blinking = "Always" }
blink_interval = 600
blink_timeout = 0

[mouse]
hide_when_typing = true
```
```
