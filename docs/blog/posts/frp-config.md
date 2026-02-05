---
date: 
  created: 2025-09-10
---

# FRP 把服务放到公网

最近使用 tinytinyrss 搭建了一个 RSS 服务，但是希望在外面的时候也可以访问，后面买了一个有 ipv4 的服务器，并且注册了域名

## 服务器配置

编辑 frps.toml 文件

```toml
# 服务器绑定的端口，客户端也要配置这个信息
bindPort = 7000
# 添加一个密码，保证客户端和服务器连接的隐秘性
auth.token = "YourPassword"
# 用于http服务的端口
vhostHTTPPort = 80
# 用于https服务的端口
vhostHTTPSPort = 443
```

需要注意的是，要保证服务器中这几个端口是开放的。

## 客户端配置

编辑 frpc.toml 文件

```toml
# 服务器的公网IP
serverAddr = "xx.xxx.xxx.xx"
# 服务器的端口，和上面配置要一致
serverPort = 7000
# 认证密码，和上面一致
auth.token = "YourPassword"

[[proxies]]
name = "web1" # 服务名称，应该无所谓吧
type = "http" # 类型，也可以写https
localPort = xxxx # 已经在客户端服务器上部署的服务的IP
customDomains = ["web1.mysite.com"] # 域名，我使用的是子域名

[[proxies]]
name = "web2"
type = "http"
localPort = xxxx
customDomains = ["web2.mysite.com"]
```

需要添加一下域名解析，我用的是子域名，如果是上面的服务，大概就是这样写

- 记录类型：A 
- 主机记录：web1.mysite.com
- 记录值：服务器的 IP 地址，也就是 serverAddr

同理，再添加 web2 的解析

## caddy

在 caddy 把服务代理出去的时候这样子设置

```text
web1.mysite.com {
    reverse_proxy localhost:80
}
```
