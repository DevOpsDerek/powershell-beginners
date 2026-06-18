BeforeAll {
    . "$PSScriptRoot/../lessons/02-data-types.ps1"
}

Describe 'ConvertTo-Fahrenheit' {
    It 'converts zero Celsius to thirty-two Fahrenheit' {
        ConvertTo-Fahrenheit -Celsius 0 | Should -Be 32
    }

    It 'converts one hundred Celsius to two hundred twelve Fahrenheit' {
        ConvertTo-Fahrenheit -Celsius 100 | Should -Be 212
    }
}

Describe 'Get-TypeName' {
    It 'returns the type name for a string' {
        Get-TypeName -Value 'hello' | Should -Be 'String'
    }

    It 'returns the type name for a datetime' {
        Get-TypeName -Value ([datetime]'2026-01-01') | Should -Be 'DateTime'
    }
}
