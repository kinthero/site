# ubuntu 设置

## 更新

```shell
sudo apt update
sudo apt upgrade -y
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

## 使用 nala 替换 apt

```shell
sudo apt install nala
```

使用方法

```shell
# 安装软件
sudo nala install neofetch htop
# 切换镜像源，可以选择前10个使用
sudo nala fetch
```

## 使用 flatpak 而不是 snap

删除 snap, [参考](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa0FFSE9yZEY2R1RFWDBjdHBTVTNLSGVoU3FRd3xBQ3Jtc0tsMEFtaUpjbExwcVYtZWktSVc1VFZ6eE5Id3laVmVnT1VnUmthR3AyYl9HLVdzRDMtUzFaLWk1M090cUk5Z2xCUG41MGxqMkc2bThwMmtFRVF1LXV1dFkxbERzRjJiclU0MXp3Znh1YU45MEpBRFRSMA&q=https%3A%2F%2Fkskroyal.com%2Fremove-snap-packages-from-ubuntu%2F&v=vLm2EHIaxOo)

安装 [flatpapk](https://flatpak.org/setup/Ubuntu)

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
sudo nala install docker.io
sudo systemctl enable docker
```

## 安装 gnome-tweaks

```shell
sudo nala install gnome-tweaks
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
