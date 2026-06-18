BeforeAll {
    . "$PSScriptRoot/../lessons/06-collections.ps1"
}

Describe 'Get-ArrayStats' {
    It 'calculates sum average min and max' {
        $stats = Get-ArrayStats -Numbers @(2, 4, 6, 8)
        $stats.Sum | Should -Be 20
        $stats.Average | Should -Be 5
        $stats.Min | Should -Be 2
        $stats.Max | Should -Be 8
    }

    It 'throws when the input array is empty' {
        { Get-ArrayStats -Numbers @() } | Should -Throw 'Numbers cannot be empty.'
    }
}

Describe 'Find-InArray' {
    It 'returns true when the item exists' {
        Find-InArray -Array @('a', 'b', 'c') -Item 'b' | Should -BeTrue
    }

    It 'returns false when the item does not exist' {
        Find-InArray -Array @('a', 'b', 'c') -Item 'z' | Should -BeFalse
    }
}

Describe 'Merge-Hashtables' {
    It 'returns a new hashtable where override keys win' {
        $merged = Merge-Hashtables -Base @{ Name = 'Sam'; Score = 70 } -Override @{ Score = 90; Grade = 'A' }
        $merged.Name | Should -Be 'Sam'
        $merged.Score | Should -Be 90
        $merged.Grade | Should -Be 'A'
    }
}
