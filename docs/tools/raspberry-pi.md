# 树莓派设置

## 使用[清华镜像源](https://mirrors.tuna.tsinghua.edu.cn/help/raspberrypi/) 

先编辑 `raspi.list` 文件
```bash
sudo vi /etc/apt/sources.list.d/raspi.list
```
替换为
```bash
deb https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ bookworm main
```
再编辑
```bash
sudo vi /etc/apt/sources.list
```
替换为
```bash
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware

deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware

# 以下安全更新软件源包含了官方源与镜像站配置，如有需要可自行修改注释切换
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware
```

## 更新系统

```
sudo apt update && sudo apt upgrade -y
```

## 设置语言

```shell
sudo apt update
sudo apt install locales -y
sudo dpkg-reconfigure locales
```

选择 `en_GB.UTF-8 UTF-8`
输入命令 `locale` 验证
## vim

安装 vim

```shell
sudo apt install vim
```

基本配置
```shell
inoremap <silent> jk <Esc>

vnoremap > >gv
vnoremap < <gv
vnoremap = =gv

set mouse=a
syntax on
filetype plugin indent on
set autoread

set encoding=utf-8
set fileencodings=utf-8

set number
set relativenumber
set cursorline

set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start

set incsearch
set hlsearch
set ignorecase
set smartcase

set laststatus=2
set showcmd
set showmode

set list
set listchars=tab:>-,trail:.

set wildmenu
set wildmode=list:longest,full

set nobackup
set nowritebackup
set noswapfile
```

## docker
安装 docker

```shell
curl -fsSL https://get.docker.com -o install-docker.sh
sudo sh install-docker.sh --mirror Aliyun
```

开机启动

```shell
sudo systemctl enable docker
```

当前用户添加到 docker 用户组

```shell
sudo usermod -aG docker $USER
newgrp docker
```

~~设置 rootless~~，不推荐

```shell
sudo apt update
sudo apt install -y uidmap
dockerd-rootless-setuptool.sh install
echo 'export DOCKER_HOST=unix:///run/user/1000/docker.sock' >> ~/.bashrc
source ~/.bashrc
sudo loginctl enable-linger [username]
# verify
docker info | grep rootless
```

设置 docker 镜像，可以在[这里](https://status.daocloud.io/status/docker)找找。root模式是 `/etc/docker/daemon.json`，rootless 模式是 `~/.config/docker/daemon.json`

```shell
sudo vim /etc/docker/daemon.json
# mkdir -p .config/docker
# vim .config/docker/daemon.json
{
  "registry-mirrors": [
    "https://docker.1ms.run"
  ]
}
# restart docker, root
sudo systemctl restart docker
# restart docker, rootless
# systemctl --user restart docker.service
```

测试一下

```shell
docker pull hello-world
```

## 网络问题

### 下载 mihomo

mihomo 这里就直接使用命令行版本，可以从 [github](https://github.com/MetaCubeX/mihomo/releases) 下载，下载的版本是 xxx-linux-arm64-xxx.deb
将文件通过 scp 复制到树莓派

```shell
scp .\mihomo-linux-arm64-alpha-xx.deb kilos@192.168.101.xx:~/
```

### 安装文件

```shell
sudo dpkg -i mihomo-linux-arm64-alpha-xx.deb
```

### 配置文件

编辑 `/etc/mihomo/config.yaml` 文件，如果不存在就创建
具体内容查看这两个链接

- [快捷配置 - 虚空终端 Docs](https://wiki.metacubex.one/example/conf/)
- [代理集合配置 - 虚空终端 Docs](https://wiki.metacubex.one/config/proxy-providers/)

创建完成配置文件可以测试一下

```shell
mihomo -t
```

创建服务启动可以参考[创建运行服务 - 虚空终端 Docs](https://wiki.metacubex.one/startup/service/)

```shell
# 开启 mihomo 服务
systemctl start mihomo

# 重新加载
systemctl reload mihomo

# 查看状态
systemctl status mihomo

# 停止服务
systemctl stop mihomo

# 关闭自启动服务
systemctl disable mihomo

# 查看运行日志
journalctl -u mihomo -o cat -e
```
