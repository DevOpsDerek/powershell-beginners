$module = Get-Module -ListAvailable -Name Pester | Sort-Object Version -Descending | Select-Object -First 1

if (-not $module) {
    Write-Output 'Pester is not installed.'
    Write-Output 'Install it with:'
    Write-Output 'Install-Module Pester -Scope CurrentUser -Force -SkipPublisherCheck'
    exit 1
}

$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$configuration = New-PesterConfiguration
$configuration.Run.Path = Join-Path -Path $projectRoot -ChildPath 'tests'
$configuration.Output.Verbosity = 'Detailed'
$configuration.Run.Exit = $true

Invoke-Pester -Configuration $configuration
