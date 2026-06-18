BeforeAll {
    . "$PSScriptRoot/../lessons/01-hello-world.ps1"
}

Describe 'Get-Greeting' {
    It 'returns a greeting for the supplied name' {
        Get-Greeting -Name 'Ada' | Should -Be 'Hello, Ada!'
    }
}

Describe 'Get-FullName' {
    It 'joins first and last names with a space' {
        Get-FullName -First 'Ada' -Last 'Lovelace' | Should -Be 'Ada Lovelace'
    }

    It 'handles empty last names without throwing' {
        Get-FullName -First 'Prince' -Last '' | Should -Be 'Prince '
    }
}
