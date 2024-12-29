# docker 网络代理

配置 `/etc/docker/daemon.json`，设置拉镜像的代理

```json
{
  "proxies": {
    "http-proxy": "http://127.0.0.1:7890",
    "https-proxy": "http://127.0.0.1:7890",
    "no-proxy": "localhost,127.0.0.1"
  }
}
```

配置 `~/.docker/config.json`，设置容器内部使用的代理，使用 docker run 的时候需要添加 `--net host`

````json
{
  "proxies": {
    "default": {
      "httpProxy": "http://127.0.0.1:7890",
      "httpsProxy": "http://127.0.0.1:7890",
      "noProxy": "localhost,127.0.0.1"
    }
  }
}

查看是否配置成功

```bash
docker run --net host --rm alpine sh -c "wget -qO - ifconfig.co/country"
````
