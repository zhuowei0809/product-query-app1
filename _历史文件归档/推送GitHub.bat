@echo off
chcp 65001
echo =======================================================
echo 正在配置 GitHub 仓库...
echo =======================================================

cd /d "c:\Users\89164\Desktop\CSO课程\产品卖点查询APP"

:: 删除旧的git配置（如果有Gitee的残留）
if exist .git (
    rmdir /s /q .git
)

:: 初始化Git
git init
git add .
git commit -m "初始化: 上传到GitHub"

echo.
echo =======================================================
echo 请输入您的 GitHub 仓库地址（右键粘贴，然后回车）：
echo 例如: https://github.com/yourname/repo.git
echo =======================================================
set /p repo_url=

:: 添加远程仓库并推送
git remote add origin %repo_url%
git branch -M main
echo.
echo 正在推送到 GitHub，可能需要您在弹出的窗口中登录...
git push -u origin main

echo.
echo =======================================================
echo ✅ 代码已推送到 GitHub！
echo 接下来请去 Cloudflare 绑定这个仓库。
echo =======================================================
pause
