BeforeAll {
    . "$PSScriptRoot/../lessons/03-operators.ps1"
}

Describe 'Invoke-Calculate' {
    Context 'Addition' {
        It 'adds two positive numbers' {
            Invoke-Calculate -A 3 -Operator '+' -B 4 | Should -Be 7
        }
    }

    Context 'Division by zero' {
        It 'throws on division by zero' {
            { Invoke-Calculate -A 5 -Operator '/' -B 0 } | Should -Throw
        }
    }

    Context 'Unknown operator' {
        It 'throws on an unsupported operator' {
            { Invoke-Calculate -A 5 -Operator '^' -B 2 } | Should -Throw 'Unknown operator: ^'
        }
    }
}

Describe 'Test-IsMatch' {
    It 'returns true when the pattern matches' {
        Test-IsMatch -Input 'cat-123' -Pattern '^cat-\d+$' | Should -BeTrue
    }

    It 'returns false when the pattern does not match' {
        Test-IsMatch -Input 'dog-abc' -Pattern '^cat-\d+$' | Should -BeFalse
    }
}
