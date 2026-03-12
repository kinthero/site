---
date: 
  created: 2025-11-16
---

# 树莓派快速重装

## ssh 连接

先删除之前的连接记录

```bash
ssh-keygen -R 192.168.101.43
```

然后连接

```bash
ssh kilos@192.168.101.43
```

## 挂载硬盘

查看硬盘

```shell
lsblk -f
```

挂载硬盘

```shell
sudo mkdir /data
sudo mount /dev/sda1 /data
ls /data
```

查看硬盘的 UUID

```shell
sudo blkid | grep 'sda1'
```

修改文件

```shell
sudo nano /etc/fstab
```

写入

```shell
UUID=xxxx /data ext4 defaults,noatime 0 2
```

最后测试一下

```shell
sudo mount -a
```
## 配置 mihomo

下载 mihomo，从[这里](https://github.com/MetaCubeX/mihomo/releases)可以找到安装包。下载 mihomo-linux-arm64-vx.xx.xx.deb。然后安装

```shell
sudo apt install mihomo-linux-arm64-vx.xx.xx.deb
```

配置配置文件 `/etc/mihomo/config.yaml`。可以从其他已经有了的复制过去。

实际使用的时候需要另外两个文件，可以从[这里](https://github.com/MetaCubeX/meta-rules-dat/releases)下载。下载 geoip.metadb, geosite.dat。放到 `/etc/mihomo/`目录下面。

基于下面的配置方便快速打开和关闭代理。

```shell
proxy() {
    if [ "$1" = "on" ]; then
	    sudo systemctl start mihomo
        export https_proxy=http://127.0.0.1:7890
        export http_proxy=http://127.0.0.1:7890
        export all_proxy=http://127.0.0.1:7890
        echo "Proxy is ON"
    elif [ "$1" = "off" ]; then
	    sudo systemctl stop mihomo
        unset https_proxy http_proxy all_proxy
        echo "Proxy is OFF"
    else
        echo "Usage: proxy [on|off]"
        echo "Current proxy settings:"
        echo "  http_proxy=$http_proxy"
        echo "  https_proxy=$https_proxy"
        echo "  all_proxy=$all_proxy"
    fi
}
```

因为其中包含 sudo 的命令，会要求输入密码，所以需要添加文件 `sudo nano /etc/sudoers.d/mihomo`，写入

```shell
kilos ALL=NOPASSWD: /bin/systemctl start mihomo, /bin/systemctl stop mihomo
```

然后 `source .bashrc`。

测试一下连接

```bash
curl -x http://127.0.0.1:7890 https://ipinfo.io
```

## 安装 docker

```shell
curl -fsSL https://get.docker.com -o install-docker.sh
sudo sh install-docker.sh --mirror Aliyun
sudo systemctl enable docker
```

添加用户组

```shell
sudo usermod -aG docker kilos
newgrp docker
groups kilos
```
### 设置代理

创建配置文件

```bash
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo nano /etc/systemd/system/docker.service.d/proxy.conf
```

写入

```bash
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:7890"
Environment="HTTPS_PROXY=http://127.0.0.1:7890"
Environment="NO_PROXY=localhost,127.0.0.1,.local"
```

重新加载 docker

```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

检查

```bash
docker info | grep -i proxy
```

### ~~使用 docker 镜像~~

编辑，`sudo nano /etc/docker/daemon.json`。

```shell
{
  "registry-mirrors": [
    "https://docker.1ms.run",
    "https://docker.m.daocloud.io",
    "https://dockerproxy.net",
    "https://gcr.m.daocloud.io",
    "https://ghcr.io",
    "https://ghcr.m.daocloud.io",
    "https://quay.io",
    "https://quay.m.daocloud.io"
  ]
}
```

重启 docker

```shell
sudo systemctl daemon-reload
sudo systemctl restart docker
```

查看是否生效

```shell
docker info | grep -A3 "Registry Mirrors"
```

测试一下是否可行了

```shell
sudo docker run --rm hello-world
```
## 安装 frp

## 配置 frpc

下载 [frp_xxx_linux_arm65.tar.gz](https://github.com/fatedier/frp/releases)。

```shell
tar -zxvf frp_0.67.0_linux_arm64.tar.gz
sudo mkdir /usr/local/frp
sudo cp frp_xxx_linux_arm64/frpc /usr/local/frp/frpc
```

把 `frpc.toml` 文件移动过去 `/usr/local/frp/frpc.toml`。

```bash
serverAddr = "xx.xxx.xxx.xx"
serverPort = xxxx
auth.token = "xxx"

[[proxies]]
name = "xxxx"
type = "http"
localPort = xxxx
customDomains = ["xxxx.kinther.site"]

[[proxies]]
name = "xxxx"
type = "http"
localPort = xxxx
customDomains = ["xxxx.kinther.site"]
```

创建 `/etc/systemd/system/frpc.service`。

```bash
[Unit]
Description=frp client
After=network.target

[Service]
ExecStart=/usr/local/frp/frpc -c /usr/local/frp/frpc.toml
Restart=on-failure
RestartSec=5s
User=nobody

[Install]
WantedBy=multi-user.target
```

设置启动

```shell
sudo systemctl daemon-reload
sudo systemctl start frpc
sudo systemctl enable frpc
```

测试一下是否可以同步了


## ~~配置 casaos~~

安装 casaos

```shell
wget -qO- https://get.casaos.io | sudo bash
```

## 配置 frpc

下载 [frp_xxx_linux_arm65.tar.gz](https://github.com/fatedier/frp/releases)。

```shell
sudo mkdir /usr/local/frp
sudo cp frp_xxx_linux_arm64/frpc /usr/local/frp/frpc
```

把 `frpc.toml` 文件移动过去 `/usr/local/frp/frpc.toml`。
把 `frpc.service` 文件移动过去 `/etc/systemd/system/frpc.service`。

设置启动

```shell
sudo systemctl daemon-reload
sudo systemctl start frpc
sudo systemctl enable frpc
```

测试一下是否可以同步了

## 查看电脑状态

添加文件 `/usr/local/bin/status`，然后 `sudo chmod +x /usr/local/bin/status`。

```shell
#!/bin/bash
echo "=========================================="
echo "🌡️  CPU温度: $(vcgencmd measure_temp | cut -d= -f2)"

# 准确的CPU使用率计算
read cpu user nice system idle iowait irq softirq steal guest < /proc/stat
total=$((user + nice + system + idle + iowait + irq + softirq + steal))
CPU_USAGE=$((100 - (idle * 100) / total))
echo "🖥️  CPU使用: ${CPU_USAGE}%"

MEM_PERCENT=$(free | awk 'NR==2{printf "%.1f%%", $3*100/$2}')
MEM_USED=$(free -h | grep Mem | awk '{print $3}')
MEM_TOTAL=$(free -h | grep Mem | awk '{print $2}')
echo "💾 内存使用: $MEM_PERCENT ($MEM_USED/$MEM_TOTAL)"
echo "💿 存储空间: $(df -h / | tail -1 | awk '{print $5 " (" $3 "/" $2 ")"}')"
echo "⏰ 运行时间: $(uptime -p | sed 's/up //')"
echo "=========================================="
```

## ssh 免密连接

在本地电脑上，生成密钥

```bash
ssh-keygen -t ed25519 -C "email"
```

复制公钥到服务器

```bash
ssh-copy-id -i C:\Users\user\.ssh\id_ed25519.pub user@ip
```

创建 `.ssh/config` 文件，写入

```
Host pi
    HostName ip
    User user
    IdentityFile ~/.ssh/id_ed25519
```
