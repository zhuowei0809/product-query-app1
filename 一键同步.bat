@echo off
chcp 65001
echo =======================================================
echo 正在将最新代码同步到 Gitee...
echo =======================================================

cd /d "c:\Users\89164\Desktop\CSO课程\产品卖点查询APP"

:: 初始化仓库（如果尚未初始化）
if not exist .git (
    git init
    echo 请输入您的 Gitee 仓库地址（右键粘贴，然后回车）：
    set /p repo_url=
    git remote add origin %repo_url%
)

:: 添加所有文件
git add .

:: 提交修改
set now=%date% %time%
git commit -m "自动更新: %now%"

:: 推送到远程
echo 正在推送到云端...
git push -u origin master

echo.
echo =======================================================
echo ✅ 代码已上传成功！
echo ⚠️  最后一步：请去 Gitee Pages 页面点击 [更新] 按钮
echo =======================================================
pause
