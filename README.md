# AI Agents共享记忆系统大脑

把 Obsidian Markdown Vault 作为跨 AI、跨设备的可读记忆层：项目进度、经过筛选的知识、错误预防规则和可复用技能都放在同一份 Git 仓库中。工具只要能读取文件就能接入；不需要 API key、插件或 MCP。

> **推荐做法：** 本仓库是可复制的空白模板。用 GitHub 的 **Use this template** 为自己建立一个私人仓库，再把自己的私人记忆留在本地。不要直接把你填写后的个人 Vault 公开。

## 五分钟开始

### 新建一个专用 Obsidian Vault

1. 在 GitHub 使用本仓库模板，给自己创建一个**私人**仓库。
2. 克隆你自己的仓库：

   ```sh
   git clone <你的私人仓库地址> ai-shared-brain
   ```

3. 在 Obsidian 里选择“打开文件夹作为库”，打开 `ai-shared-brain`。
4. 把该目录添加到每个 AI 工具可读取的工作区。工具入口见 [`docs/INTEGRATIONS.md`](docs/INTEGRATIONS.md)。
5. 每台设备先拉取再编辑；结束时提交并推送。可选安装 Obsidian Git 插件自动执行 Git 操作，但建议先熟悉 Git 状态与冲突处理。

### 安装到已有 Obsidian 库

安装器只复制缺少的模板文件，**遇到同名文件会跳过，不覆盖已有笔记**：

```sh
bash scripts/install.sh --vault "/你的/Obsidian库路径" --dry-run
bash scripts/install.sh --vault "/你的/Obsidian库路径"
```

Windows PowerShell：

```powershell
.\scripts\install.ps1 -VaultPath "D:\你的Obsidian库" -WhatIf
.\scripts\install.ps1 -VaultPath "D:\你的Obsidian库"
```

详细步骤见 [`docs/INSTALLATION.md`](docs/INSTALLATION.md)。

## 里面有什么

| 区域 | 作用 |
| --- | --- |
| `00-索引/AI入口.md` | 会话开始/结束规则与任务路由 |
| `00-索引/AI数据层.md` | 给 AI 的关键词到文件映射，避免每次扫描全库 |
| `30-方法/` | 协作准则、知识写入、收集去重、字段规范、自我维护和错误模式 |
| `40-协作/当前进度.md` | 一份轻量共享状态；并行工作另写交接文件 |
| `50-技能/` | 跨工具可读的 Markdown 技能 |
| `60-模板/` | 可选的 AI 身份、用户画像和风格空白模板 |
| `AGENTS.md`、`SKILL.md`、`CLAUDE.md`、`.cursor/`、`.github/` 等 | 常见编码助手入口适配 |
| `scripts/install.*` | 安装到已有 Vault 的无覆盖安装器 |

项目结构说明见 [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md)。

## 记忆边界

- **共享层**：可复用方法、已核实的错误预防、非敏感项目状态、公共来源和技能。
- **本地层**：密钥、访问令牌、账号信息、个人画像、私人日记、未筛选的会话内容。放入 `本地私有/` 或 `*.local.md`；这些路径已写入 `.gitignore`。
- **会话层**：模型当前对话的上下文仍属于各工具。此项目共享的是被写入文件并同步的知识，不会合并或复制不同模型的会话。

即使 GitHub 仓库是私人仓库，也要按最小必要原则检查每次提交。共享只在各工具被授予本地文件或仓库访问能力后生效；纯网页对话需手动提供相关资料。

## 安全与维护原则

- 默认不安装定时任务、不自动改写工具的全局配置、不自动删除或覆盖文件。
- 自我维护先生成检查结果和修改建议；合并、删除、迁移和公开发布由仓库所有者审阅。
- 多设备编辑共享状态前先 `git pull`；发生冲突时保留双方内容，确认后再整理。
- 外部资料先放 Inbox，记录来源和日期，审阅、去重后才进入长期知识。

## 参考与致谢

本项目独立实现，参考了 [夏天（AI工作流）的多 AI 共享大脑视频](https://www.douyin.com/video/7676820183100476707) 的 GitHub 共享、技能复用和密钥隔离思路，以及 [Obsidian AI Memory System](https://github.com/gg1356088/obsidian-ai-memory-system) 的路由索引、错误模式、知识收集流程和安装体验。没有复制其代码；不隶属于视频作者或该项目。

## 许可

本仓库原创内容以 MIT License 发布，见 [`LICENSE`](LICENSE)。
