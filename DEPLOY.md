# 部署到 GitHub Pages 指南

## 第一步：安装 Git

1. 访问 https://git-scm.com/download/win 下载 Git for Windows
2. 运行安装程序，全程默认选项即可
3. 安装完成后，重新打开 PowerShell（或命令提示符）

## 第二步：在 GitHub 上创建仓库

1. 登录 GitHub：https://github.com
2. 点击右上角 "+" → "New repository"
3. 填写仓库信息：
   - Repository name: `task-log`（或你喜欢的名字）
   - Description: `任务日志追踪应用`
   - 选择 Public（公开）
   - **不要勾选** "Add a README file"
4. 点击 "Create repository"

## 第三步：本地初始化并推送

在 "e:\Task follow" 文件夹中打开 PowerShell，执行以下命令：

```powershell
# 1. 初始化 Git 仓库
git init

# 2. 添加所有文件
git add .

# 3. 提交（引号内是提交说明）
git commit -m "Initial commit - 任务日志应用"

# 4. 添加远程仓库（把 YOUR_USERNAME 替换成你的 GitHub 用户名）
git remote add origin https://github.com/YOUR_USERNAME/task-log.git

# 5. 推送代码
git branch -M main
git push -u origin main
```

提示：执行第 4 步时需要输入 GitHub 用户名和密码（或者 Personal Access Token）。

## 第四步：启用 GitHub Pages

1. 在 GitHub 仓库页面，点击 "Settings"（设置）
2. 左侧菜单找到 "Pages"
3. 在 "Source" 部分：
   - Branch: 选择 `main`
   - Folder: 选择 `/ (root)`
   - 点击 "Save"
4. 等待 1-2 分钟，页面会刷新
5. 你的网站地址将是：`https://YOUR_USERNAME.github.io/task-log`

## 第五步：验证部署

打开浏览器访问你的网站地址，确认应用正常显示。

## 第六步：转换为 APK（可选）

访问以下网站之一：
- https://www.pwabuilder.com
- https://www.webintoapp.com
- https://appsgeyser.com

输入你的网站地址，按照提示操作即可生成 APK 安装包。
