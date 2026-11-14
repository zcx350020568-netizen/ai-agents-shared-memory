# 安装与设备同步

## 方式 A：把仓库本身作为 Vault（推荐）

1. 在 GitHub 从模板创建自己的私人仓库。模板公开后，打开项目页面并选择 **Use this template**。
2. 使用 Git 克隆自己创建的仓库：`git clone <自己的仓库地址> ai-shared-brain`。
3. 在 Obsidian 选择“打开文件夹作为库”，选中克隆目录。
4. 将同一目录加入各 AI 工具可读的工作区。

这种方式保留完整 Git 历史、AI 入口文件和适配配置。

## 方式 B：把起始笔记加到已有 Vault

先克隆本模板到临时目录，再用对应平台的安装器。安装器要求 Vault 目录已存在，并且**只新增不存在的文件**。

macOS / Linux：

```sh
bash scripts/install.sh --vault "/path/to/existing-vault" --dry-run
bash scripts/install.sh --vault "/path/to/existing-vault"
```

Windows PowerShell：

```powershell
.\scripts\install.ps1 -VaultPath "C:\path\to\existing-vault" -WhatIf
.\scripts\install.ps1 -VaultPath "C:\path\to\existing-vault"
```

先阅读预览，再运行实际安装。安装器不会覆盖同名文件；跳过的文件需要你自行比较并合并。它不会安装 Obsidian 插件、配置 Git 凭据或修改 AI 工具的全局设置。

## Git 同步流程

每台设备都要认证访问同一个私人仓库。每次工作按以下顺序：

1. `git pull --rebase`，查看变更和 `git status`。
2. 只编辑当前任务相关文件；同一时间避免多个工具改写 `40-协作/当前进度.md`。
3. 结束后检查 `git diff`，去掉敏感内容。
4. `git add` 明确的文件，提交后推送。
5. 另一台设备先拉取，再开始下一轮。

如果多个设备离线编辑，先保留冲突双方内容，再人工合并；不要用强制推送覆盖远端。

## 隐私文件

把已填写的身份/用户画像模板放到 `本地私有/`，或复制成 `*.local.md` 文件。`.gitignore` 会忽略这些路径。公开模板仓库请使用空白模板，绝不要把私人 Vault 改成公开仓库。
