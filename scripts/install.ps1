[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Low')]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$VaultPath
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $VaultPath -PathType Container)) {
    throw "Vault directory does not exist: $VaultPath"
}

$vault = (Resolve-Path -LiteralPath $VaultPath).Path
$sourceRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$files = @(
    '00-索引/首页.md',
    '00-索引/AI入口.md',
    '00-索引/AI数据层.md',
    '00-索引/共享脑与本地脑边界.md',
    '10-项目/项目索引.md',
    '20-事件/日志索引.md',
    '30-方法/协作准则.md',
    '30-方法/知识库规则.md',
    '30-方法/知识收集工作流.md',
    '30-方法/字段规范.md',
    '30-方法/自我维护机制.md',
    '30-方法/错误经验库.md',
    '40-协作/当前进度.md',
    '40-协作/会话交接/模板.md',
    '40-协作/决策记录/模板.md',
    '50-技能/README.md',
    '50-技能/模板/SKILL.md',
    '60-模板/identity.md',
    '60-模板/user.md',
    '60-模板/soul.md',
    '90-其他/收件箱.md'
)

foreach ($relativePath in $files) {
    $source = Join-Path $sourceRoot $relativePath
    $destination = Join-Path $vault $relativePath

    if (-not (Test-Path -LiteralPath $source -PathType Leaf)) {
        throw "Template file is missing: $source"
    }
    if (Test-Path -LiteralPath $destination) {
        Write-Output "Skip existing: $relativePath"
        continue
    }

    $parent = Split-Path -Parent $destination
    if ($PSCmdlet.ShouldProcess($destination, 'Add missing shared-brain template')) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
        Copy-Item -LiteralPath $source -Destination $destination
        Write-Output "Added: $relativePath"
    }
}

Write-Output 'Review the new files and Git diff before syncing.'
