$module = Get-Module -ListAvailable -Name PSScriptAnalyzer | Select-Object -First 1

if (-not $module) {
    Write-Output 'PSScriptAnalyzer is not installed.'
    Write-Output 'Install it with:'
    Write-Output 'Install-Module PSScriptAnalyzer -Scope CurrentUser -Force'
    exit 1
}

$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$settingsPath = Join-Path -Path $projectRoot -ChildPath 'PSScriptAnalyzerSettings.psd1'
$paths = @(
    (Join-Path -Path $projectRoot -ChildPath 'lessons')
    (Join-Path -Path $projectRoot -ChildPath 'tests')
)

$results = Invoke-ScriptAnalyzer -Path $paths -Settings $settingsPath -Recurse -Severity Error, Warning

if (-not $results) {
    Write-Output 'No ScriptAnalyzer issues found.'
    exit 0
}

$results |
    Sort-Object ScriptName, Line, Column |
    Format-Table Severity, RuleName, ScriptName, Line, Message -AutoSize

if ($results) {
    exit 1
}
