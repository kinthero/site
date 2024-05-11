# python 环境配置

本文只讲 windows 的 python 环境配置

## 安装 python

安装 python 的方法有很多，目前个人比较喜欢用 scoop 安装 python，主要原因有以下几点：

- 方便的切换不同版本的 python
- 占用空间小，相比较于 conda

scoop 安装和切换 python 命令

```powershell
# 添加其他版本的python的仓库
scoop bucket add versions
# 查看可以安装的python版本
scoop bucket search python
# 安装某个版本的python
scoop install python310
# 安装较新版本的python
scoop install python
# 切换python的版本
scoop reset python310
```

## 环境管理

目前感觉速度最快的 python 环境管理工具是 [uv](https://github.com/astral-sh/uv)

安装 uv，这里使用 powershell 安装，后面提到的 pipx 也可以安装，但是好像不能自我更新

```powershell
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
```

基本使用

```powershell
# 创建虚拟环境
uv venv
# 激活虚拟环境
.venv\Scripts\Activate
# 安装包
uv pip install mkdocs-material -i https://pypi.tuna.tsinghua.edu.cn/simple
# 推出虚拟环境
deactivate
```

为了方便使用，在 powershell 中添加命令别名，powershell 中执行`code $profile`添加以下命令：

```powershell
New-Alias -Name av -Value '.\.venv\Scripts\Activate.ps1'
New-Alias -Name dav -Value 'deactivate'
```

之后，`av`启动虚拟环境，`dav`退出虚拟环境

## 安装 python 工具

有一些 python 写的工具需要使用，比如 ruff，mypy 等，或者是 UV，这里 使用 pipx 进行安装。pipx 安装后每个程序都是独立的虚拟环境中运行，很好的实现隔离，方便调用

这里使用 scoop 安装 [pipx](https://github.com/pypa/pipx)

```powershell
scoop install pipx
```

使用 pipx 安装一些常用的工具

```powershell
pipx install ruff
pipx install mypy
pipx install cowsay
```
