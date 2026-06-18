BeforeAll {
    . "$PSScriptRoot/../lessons/10-capstone-file-io.ps1"
    $TestDrivePath = Join-Path -Path $PSScriptRoot -ChildPath 'artifacts-grade-report'
    if (-not (Test-Path -Path $TestDrivePath)) {
        New-Item -Path $TestDrivePath -ItemType Directory | Out-Null
    }
}

AfterAll {
    Remove-Item -Path $TestDrivePath -Recurse -Force -ErrorAction SilentlyContinue
}

Describe 'New-StudentRecord' {
    It 'creates a record with the correct grade' {
        $student = New-StudentRecord -Name 'Ava' -Score 95
        $student.Name | Should -Be 'Ava'
        $student.Score | Should -Be 95
        $student.Grade | Should -Be 'A'
        $student.Timestamp | Should -Not -BeNullOrEmpty
    }

    It 'throws for invalid scores' {
        { New-StudentRecord -Name 'Ava' -Score 101 } | Should -Throw 'Score must be between 0 and 100.'
    }
}

Describe 'Export-GradeReport and Import-GradeReport' {
    It 'exports and imports student records as CSV' {
        $path = Join-Path -Path $TestDrivePath -ChildPath 'grades.csv'
        $students = @(
            (New-StudentRecord -Name 'Ava' -Score 95)
            (New-StudentRecord -Name 'Noah' -Score 82)
        )

        Export-GradeReport -Students $students -Path $path | Should -Be $path
        $imported = Import-GradeReport -Path $path
        $imported.Count | Should -Be 2
        $imported[0].Name | Should -Be 'Ava'
        $imported[1].Grade | Should -Be 'B'
    }
}

Describe 'Get-ClassAverage' {
    It 'returns the average score' {
        $students = @(
            @{ Name = 'A'; Score = 80; Grade = 'B'; Timestamp = [datetime]::UtcNow }
            @{ Name = 'B'; Score = 100; Grade = 'A'; Timestamp = [datetime]::UtcNow }
        )

        Get-ClassAverage -Students $students | Should -Be 90
    }

    It 'throws for empty input' {
        { Get-ClassAverage -Students @() } | Should -Throw 'Students cannot be empty.'
    }
}
