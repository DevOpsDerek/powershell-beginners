BeforeAll {
    . "$PSScriptRoot/../lessons/04-conditionals.ps1"
}

Describe 'Get-Season' {
    It 'returns Spring for April' {
        Get-Season -Month 4 | Should -Be 'Spring'
    }

    It 'returns Winter for December' {
        Get-Season -Month 12 | Should -Be 'Winter'
    }

    It 'throws for invalid months' {
        { Get-Season -Month 13 } | Should -Throw 'Month must be between 1 and 12.'
    }
}

Describe 'Get-LetterGrade' {
    It 'returns A for ninety or above' {
        Get-LetterGrade -Score 95 | Should -Be 'A'
    }

    It 'returns F for fifty-nine' {
        Get-LetterGrade -Score 59 | Should -Be 'F'
    }

    It 'throws for out-of-range scores' {
        { Get-LetterGrade -Score 120 } | Should -Throw 'Score must be between 0 and 100.'
    }
}

Describe 'Get-DayType' {
    It 'returns Weekend for Sunday' {
        Get-DayType -DayName 'Sunday' | Should -Be 'Weekend'
    }

    It 'returns Weekday for Monday' {
        Get-DayType -DayName 'Monday' | Should -Be 'Weekday'
    }
}
