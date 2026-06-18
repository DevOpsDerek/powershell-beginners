BeforeAll {
    . "$PSScriptRoot/../lessons/08-functions-advanced.ps1"
}

Describe 'Get-StringInfo' {
    It 'returns string information for direct parameter input' {
        $result = Get-StringInfo -Text 'Hello World'
        $result.Length | Should -Be 11
        $result.Upper | Should -Be 'HELLO WORLD'
        $result.Lower | Should -Be 'hello world'
        $result.WordCount | Should -Be 2
        $result.IsNullOrEmpty | Should -BeFalse
    }

    It 'accepts pipeline input' {
        $results = 'one two', 'three' | Get-StringInfo
        $results[0].WordCount | Should -Be 2
        $results[1].WordCount | Should -Be 1
    }

    It 'reports empty strings correctly' {
        $result = Get-StringInfo -Text ''
        $result.IsNullOrEmpty | Should -BeTrue
        $result.WordCount | Should -Be 0
    }
}

Describe 'ConvertTo-Slug' {
    It 'creates a clean slug' {
        ConvertTo-Slug -Text 'Hello, PowerShell World!' | Should -Be 'hello-powershell-world'
    }

    It 'throws when text is empty' {
        { ConvertTo-Slug -Text '' } | Should -Throw
    }
}
