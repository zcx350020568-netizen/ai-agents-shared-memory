#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Install the shared-brain starter notes into an existing Obsidian vault.

Usage:
  bash scripts/install.sh --vault PATH [--dry-run]

Existing files are skipped. Nothing is overwritten or deleted.
EOF
}

vault_path=""
dry_run=0
while (($#)); do
  case "$1" in
    --vault)
      if (($# < 2)); then echo "Missing path after --vault" >&2; exit 2; fi
      vault_path="$2"
      shift 2
      ;;
    --dry-run)
      dry_run=1
      shift
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [[ -z "$vault_path" ]]; then
  echo "Provide an explicit existing vault with --vault PATH." >&2
  usage >&2
  exit 2
fi
if [[ ! -d "$vault_path" ]]; then
  echo "Vault directory does not exist: $vault_path" >&2
  exit 2
fi
vault_path="$(cd "$vault_path" && pwd)"

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source_root="$(cd "$script_dir/.." && pwd)"
files=(
  "00-索引/首页.md"
  "00-索引/AI入口.md"
  "00-索引/AI数据层.md"
  "00-索引/共享脑与本地脑边界.md"
  "10-项目/项目索引.md"
  "20-事件/日志索引.md"
  "30-方法/协作准则.md"
  "30-方法/知识库规则.md"
  "30-方法/知识收集工作流.md"
  "30-方法/字段规范.md"
  "30-方法/自进化机制.md"
  "30-方法/错误经验库.md"
  "40-协作/当前进度.md"
  "40-协作/会话交接/模板.md"
  "40-协作/决策记录/模板.md"
  "50-技能/README.md"
  "50-技能/模板/SKILL.md"
  "60-模板/identity.md"
  "60-模板/user.md"
  "60-模板/soul.md"
  "90-其他/收件箱.md"
)

for relative_path in "${files[@]}"; do
  source_file="$source_root/$relative_path"
  destination="$vault_path/$relative_path"
  if [[ ! -f "$source_file" ]]; then
    echo "Template file is missing: $source_file" >&2
    exit 1
  fi
  if [[ -e "$destination" || -L "$destination" ]]; then
    echo "Skip existing: $relative_path"
    continue
  fi
  if ((dry_run)); then
    echo "Would add: $relative_path"
  else
    mkdir -p "$(dirname "$destination")"
    cp "$source_file" "$destination"
    echo "Added: $relative_path"
  fi
done

if ((dry_run)); then
  echo "Preview only. Re-run without --dry-run to add missing files."
else
  echo "Install complete. Review the new files and Git diff before syncing."
fi
