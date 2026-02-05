# GitHub Pages 部署指南（最简单的免费方案）

## 为什么选择 GitHub Pages？
✅ 完全免费，无需信用卡
✅ 无需实名认证
✅ 全球CDN加速
✅ 支持自定义域名
✅ 在中国大陆访问速度尚可

---

## 📋 部署步骤（5分钟）

### 第1步：注册GitHub账号
1. 访问：https://github.com
2. 点击"Sign up"注册
3. 填写邮箱、密码、用户名
4. 验证邮箱
5. 登录

### 第2步：创建仓库
1. 点击右上角 "+" → "New repository"
2. 填写：
   - Repository name: `product-query-app`
   - 选择 "Public"（公开）
   - ✅ 勾选 "Add a README file"
3. 点击 "Create repository"

### 第3步：上传文件
1. 在仓库页面，点击 "Add file" → "Upload files"
2. 拖拽这3个文件：
   - index.html
   - styles.css
   - app.js
3. 在底部填写提交信息（随便写，如"初始提交"）
4. 点击 "Commit changes"

### 第4步：启用GitHub Pages
1. 在仓库页面，点击 "Settings"（设置）
2. 在左侧菜单找到 "Pages"
3. 在 "Source" 下拉框选择 "main" 分支
4. 点击 "Save"
5. 等待1-2分钟

### 第5步：获取访问地址
页面会显示您的网站地址：
```
https://您的用户名.github.io/product-query-app
```

🎉 完成！复制这个地址，用手机浏览器访问测试！

---

## 📱 如何更新产品数据？

### 方法1：网页直接编辑（推荐）
1. 在GitHub仓库中点击 `app.js` 文件
2. 点击右上角的铅笔图标 ✏️（Edit）
3. 修改 `productDatabase` 中的产品数据
4. 点击 "Commit changes"
5. 等待1分钟，网站自动更新

### 方法2：重新上传
1. 修改本地的 `app.js` 文件
2. 在GitHub仓库删除旧的 `app.js`
3. 上传新的 `app.js`
4. 自动更新

---

## 💡 提示
- GitHub Pages 在中国访问速度一般，但完全可用
- 如果需要更快速度，可以考虑绑定国内CDN
- 完全免费，无任何限制

---

## 🆚 如果GitHub访问困难

可以使用 Gitee，但需要：
1. 完成实名认证（上传身份证）
2. 然后才能使用 Gitee Pages

或者使用云服务器（需要付费）：
- 阿里云 OSS
- 腾讯云 COS
