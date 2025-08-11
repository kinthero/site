# Ubuntu 设置

## 更新

```shell
sudo apt update && sudo apt upgrade -y
```

查看系统版本

```shell
lsb_release -a
```

## 英伟达驱动

英伟达驱动默认是安装了的

```shell
nvidia-smi
```

## 把主目录下文件夹改成英文

```bash
export LANG=en_US
xdg-user-dirs-gtk-update
# click update names
export LANG=zh_CH
```

## ulauncher

### 修改ulauncher的宽度

编辑文件

```bash
sudo vim /usr/share/ulauncher/ui/UlauncherWindow.ui
```

修改 `width_request`

### 修改ulauncher主题

下载安装catppuccin主题

```bash
python3 <(curl https://raw.githubusercontent.com/catppuccin/ulauncher/main/install.py -fsSL)
```

在设置中切换主题


## emacs

### 安装 emacs

```bash
sudo snap install emacs --classic
```

## 安装 ollama

```shell
curl -fsSL https://ollama.com/install.sh | sh
```

使用

```shell
ollama run llama3.2
```

## 安装 docker

```shell
sudo apt install docker.io
sudo systemctl enable docker
```

## 终端设置

安装 fish

```shell
# 安装 fish
sudo nala install fish
# 切换默认 shell
chsh -s /usr/bin/fish
```

安装 starship

```shell
curl -sS https://starship.rs/install.sh | sh
vim ~/.config/fish/config.fish
# 添加到打开的文件
starship init fish | source
```

## dock 图标点击时最小化

```shell
# 最小化
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
# 多个窗口会显示预览，一个窗口就最小化
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
```

## 安装常用软件

```shell
sudo nala install flameshot gnome-tweaks eza ripgrep nodejs npm
```

安装 neovim

```shell
sudo snap install --beta nvim --classic
```

安装 grub-customer，添加不上 ppa 的时候使用 -E 参数来使用环境变量中设置的系统代理。

```shell
sudo -E add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install grub-customizer
```


## 加载数据盘

因为数据放在另一个磁盘，所以设置自动加载硬盘，然后映射以下目录

### 设置自动加载硬盘

保证加载目录存在

```bash
sudo mkdir -p /mnt/data
```

查找需要加载的硬盘的UUID。
可以使用 `lsblk` 先确定硬盘的名称叫什么。
然后使用 `sudo blkid` 查找 UUID。

编辑`/etc/fstab`文件，

```bash
 sudo nvim /etc/fstab
```

添加一行

```
UUID=YOUR_UUID  /mnt/data  ntfs-3g  defaults,uid=1000,gid=1000  0  0
```

运行

```bash
sudo systemctl daemon-reload
```

加载硬盘

```bash
sudo mount -a
```

### 创建软链接 


这里我只需要使用磁盘中的kilos目录就可以。

```bash
ln -s /mnt/data/kilos ~/d
```

## flameshot

### 安装

```bash
sudo apt install flameshot
```

### 设置快捷键

在ubuntu的设置中，选择键盘，选择键盘快捷键，查看及自定义快捷键，自定义快捷键，点击加号新建一个快捷键

- 名称：shot
- 命令：flameshot gui
- 快捷键：F1

也可以在软件的配置中把在桌面上固定图形设置为快捷键 <kbd>Ctrl-T</kbd>

## uv

uv是我喜欢使用的python环境

### 安装uv

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

然后，`source ~/.local/bin/env` 在当前终端激活
