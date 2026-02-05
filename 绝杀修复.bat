@echo off
chcp 65001
echo =======================================================
echo 正在执行绝杀修复方案...
echo =======================================================

cd /d "c:\Users\89164\Desktop\CSO课程\产品卖点查询APP"

:: 1. 创建 wrangler.json 配置文件
echo 正在创建 Cloudflare 配置文件...
(
echo {
echo   "name": "product-query-app",
echo   "compatibility_date": "2024-09-23",
echo   "assets": {
echo     "directory": "."
echo   }
echo }
) > wrangler.json

:: 2. 重新初始化并强制推送
echo 正在清理旧配置并强制推送...
if exist .git (
    rmdir /s /q .git
)

git init
git add .
git commit -m "绝杀修复: 添加wrangler.json配置"

echo.
echo =======================================================
echo 请最后一次输入您的 GitHub 仓库地址（右键粘贴）：
echo 例如: https://github.com/zhuowei0809/product-query-app1.git
echo =======================================================
set /p repo_url=

git remote add origin %repo_url%
git branch -M main

echo.
echo 正在强制推送到云端...
git push -u origin main --force

echo.
echo =======================================================
echo ✅ 修复文件已上传！
echo Cloudflare 这次应该能读懂配置了。
echo 请等待 1-2 分钟，然后刷新 Cloudflare 页面查看结果。
echo =======================================================
pause
