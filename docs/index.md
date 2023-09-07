# Welcome to Kinther's Site

This is Kinther's personal site using mkdocs.

用来提交博客的脚本

```powershell title="$profile"
function post-blog {
    cd /local/path/to/site/
    $CurrentTime = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    git add .
    git commit -m "commit at $CurrentTime"
    cd ..\kinthero.github.io\
    mkdocs gh-deploy -f ..\site\mkdocs.yml -b master
}
```
