BeforeAll {
    . "$PSScriptRoot/../lessons/09-error-handling.ps1"
    $TestDrivePath = Join-Path -Path $PSScriptRoot -ChildPath 'artifacts'
    if (-not (Test-Path -Path $TestDrivePath)) {
        New-Item -Path $TestDrivePath -ItemType Directory | Out-Null
    }
}

AfterAll {
    Remove-Item -Path $TestDrivePath -Recurse -Force -ErrorAction SilentlyContinue
}

Describe 'Invoke-SafeDivide' {
    It 'divides two numbers successfully' {
        Invoke-SafeDivide -Numerator 10 -Denominator 2 | Should -Be 5
    }

    It 'throws a divide by zero exception with the expected message' {
        { Invoke-SafeDivide -Numerator 10 -Denominator 0 } | Should -Throw 'Cannot divide by zero'
    }
}

Describe 'Read-JsonConfig' {
    It 'reads valid JSON files' {
        $path = Join-Path -Path $TestDrivePath -ChildPath 'valid.json'
        Set-Content -Path $path -Value '{"Name":"Demo","Retries":2}'
        $config = Read-JsonConfig -Path $path
        $config.Name | Should -Be 'Demo'
        $config.Retries | Should -Be 2
    }

    It 'throws when the config file does not exist' {
        $path = Join-Path -Path $TestDrivePath -ChildPath 'missing.json'
        { Read-JsonConfig -Path $path } | Should -Throw "Config file not found: $path"
    }

    It 'throws when the JSON is invalid' {
        $path = Join-Path -Path $TestDrivePath -ChildPath 'invalid.json'
        Set-Content -Path $path -Value '{"Name":'
        { Read-JsonConfig -Path $path } | Should -Throw "Invalid JSON in: $path"
    }
}
