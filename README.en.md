# AI Shared Brain | Obsidian × Multiple AI Tools

An Obsidian-compatible Markdown vault for shared project status, reviewed knowledge, error-prevention notes, and reusable skills across AI tools and devices. Any tool that can read local files can use it. No API key, plugin, or MCP server is required.

> This is a blank template. Use GitHub's **Use this template** to create your own private repository. Never publish a personal vault after filling it with private information.

## Quick start

1. Create your own private repository from this template.
2. Clone it: `git clone <your-private-repository-url> ai-shared-brain`.
3. Open the cloned folder as an Obsidian vault.
4. Give each AI tool access to that folder and point it to `AGENTS.md` and `00-索引/AI入口.md`.
5. Pull before editing and commit/push when finished. Optional Git plugins can automate Git operations, but review Git status and conflicts.

To add the starter notes to an existing vault, use `scripts/install.sh --vault <path>` or `scripts/install.ps1 -VaultPath <path>`. The installers skip files that already exist.

## Privacy model

Keep reusable, non-sensitive knowledge in the shared repository. Keep credentials, account details, personal profiles, private journals, and unreviewed conversation dumps local under `本地私有/` or `*.local.md`; these paths are ignored by Git. A shared repository does not merge AI conversation contexts or grant tools access automatically.

See [Installation](docs/INSTALLATION.md), [Integrations](docs/INTEGRATIONS.md), and [Architecture](docs/ARCHITECTURE.md). Original work is licensed under MIT. The project is independently implemented and inspired by the linked video and [Obsidian AI Memory System](https://github.com/gg1356088/obsidian-ai-memory-system); no code was copied.
