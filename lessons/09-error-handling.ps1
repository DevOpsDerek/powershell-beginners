<#
Lesson 09: Error Handling
Learning Objectives:
- Handle failures with try, catch, and finally
- Understand $ErrorActionPreference and -ErrorAction
- Create useful terminating errors with throw
- Inspect the current error using $_ and $Error[0]
Estimated Time: 30 minutes
Prerequisites: Lessons 01-08
#>

# Error handling keeps your scripts predictable when something goes wrong.
$oldErrorActionPreference = $ErrorActionPreference
$ErrorActionPreference = 'Continue'

try {
    Get-Item -Path 'definitely-not-a-real-file.txt' -ErrorAction Stop | Out-Null
}
catch {
    Write-Output "Caught example error type: $($_.Exception.GetType().Name)"
    Write-Output "Latest error from `$Error[0]: $($Error[0].Exception.Message)"
}
finally {
    $ErrorActionPreference = $oldErrorActionPreference
    Write-Output 'Finally block ran, so cleanup code can go here.'
}

function Invoke-SafeDivide {
    param(
        [double]$Numerator,
        [double]$Denominator
    )

    if ($Denominator -eq 0) {
        throw [System.DivideByZeroException]::new('Cannot divide by zero')
    }

    $Numerator / $Denominator
}

function Read-JsonConfig {
    param(
        [string]$Path
    )

    if (-not (Test-Path -Path $Path)) {
        throw "Config file not found: $Path"
    }

    try {
        $rawJson = Get-Content -Path $Path -Raw -ErrorAction Stop
        $rawJson | ConvertFrom-Json -ErrorAction Stop
    }
    catch {
        throw "Invalid JSON in: $Path"
    }
}

# Demo: create a temporary JSON file so learners can see a successful read.
$demoPath = Join-Path -Path ([System.IO.Path]::GetTempPath()) -ChildPath 'powershell-beginners-config.json'
Set-Content -Path $demoPath -Value '{"Theme":"Dark","Retries":3}'
$config = Read-JsonConfig -Path $demoPath
Write-Output "Read-JsonConfig example theme: $($config.Theme)"
Remove-Item -Path $demoPath -ErrorAction SilentlyContinue

# ---- FOLLOW ALONG ----
# TODO 1: Change the demo JSON to include another property.
# TODO 2: Create invalid JSON and observe the thrown message.
# TODO 3: Catch DivideByZeroException from Invoke-SafeDivide.
# TODO 4: Experiment with -ErrorAction Continue vs Stop on a failing command.
