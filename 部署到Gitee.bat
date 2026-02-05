@echo off
echo =====================================
echo Gitee Pages 部署脚本
echo =====================================
echo.

REM 初始化Git仓库
git init

REM 添加所有文件
git add .

REM 提交
git commit -m "初始化产品卖点查询APP"

echo.
echo =====================================
echo 请输入您的Gitee仓库地址
echo 格式: https://gitee.com/您的用户名/仓库名.git
echo =====================================
set /p repo_url="Gitee仓库地址: "

REM 添加远程仓库
git remote add origin %repo_url%

REM 推送到Gitee
git branch -M master
git push -u origin master

echo.
echo =====================================
echo 上传完成！
echo 现在请：
echo 1. 访问您的Gitee仓库页面
echo 2. 点击 "服务" -> "Gitee Pages"
echo 3. 点击 "启动" 按钮
echo 4. 等待几秒，获得访问地址！
echo =====================================
pause
