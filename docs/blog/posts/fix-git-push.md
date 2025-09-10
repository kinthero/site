---
date: 
  created: 2025-09-08
---
# git push 出错

突然 git push 出错了，好像是说 22 端口被封了，解决方案来自[GitHub](https://docs.github.com/zh/authentication/troubleshooting-ssh/using-ssh-over-the-https-port)
修改 ~/.ssh/config 文件，添加

```
Host github.com
    Hostname ssh.github.com
    Port 443
    User git
```
