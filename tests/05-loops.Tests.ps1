BeforeAll {
    . "$PSScriptRoot/../lessons/05-loops.ps1"
}

Describe 'Get-Factorial' {
    It 'returns one for zero' {
        Get-Factorial -N 0 | Should -Be 1
    }

    It 'returns one hundred twenty for five' {
        Get-Factorial -N 5 | Should -Be 120
    }

    It 'throws for negative input' {
        { Get-Factorial -N -1 } | Should -Throw 'N must be zero or greater.'
    }
}

Describe 'Get-FizzBuzz' {
    It 'returns the expected FizzBuzz sequence to fifteen' {
        Get-FizzBuzz -Max 15 | Should -Be @('1', '2', 'Fizz', '4', 'Buzz', 'Fizz', '7', '8', 'Fizz', 'Buzz', '11', 'Fizz', '13', '14', 'FizzBuzz')
    }

    It 'returns an empty array for zero' {
        (Get-FizzBuzz -Max 0).Count | Should -Be 0
    }
}

Describe 'Get-EvenNumbers' {
    It 'returns even numbers up to the maximum' {
        Get-EvenNumbers -Max 10 | Should -Be @(2, 4, 6, 8, 10)
    }

    It 'returns an empty array when no even numbers are available' {
        (Get-EvenNumbers -Max 1).Count | Should -Be 0
    }
}
