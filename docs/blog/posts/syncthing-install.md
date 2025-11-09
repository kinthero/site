---
date: 
  created: 2025-11-09
---

# 安装 Syncthing

windows 下面安装

```shell
scoop install syncthing 
scoop install nssm
scoop install sudo
```

nssm 用来设置 syncthing 开启自启的

用这个命令开始安装

```shell 
nssm install syncthing
```

然后路径选择 syncthing 的安装路径，参数写入下面的，需要先创建好 home 参数的路径

```
--no-console --no-browser --home="C:\Users\<username>\scoop\persist\syncthing\data"
```

最后点击 install 就可以了。

安装完成了之后开始启动。

```shell 
sc start syncthing
```

然后打开网址 [http://127.0.0.1:8384](http://127.0.0.1:8384)。就可以看到服务的运行状态了。



