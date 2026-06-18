BeforeAll {
    . "$PSScriptRoot/../lessons/07-functions-basics.ps1"
}

Describe 'Get-CircleArea' {
    It 'returns the correct area for radius three' {
        Get-CircleArea -Radius 3 | Should -Be ([Math]::PI * 9)
    }
}

Describe 'New-Rectangle' {
    It 'returns width height area and perimeter' {
        $rectangle = New-Rectangle -Width 5 -Height 2
        $rectangle.Width | Should -Be 5
        $rectangle.Height | Should -Be 2
        $rectangle.Area | Should -Be 10
        $rectangle.Perimeter | Should -Be 14
    }
}

Describe 'ConvertTo-TitleCase' {
    It 'converts lowercase text to title case' {
        ConvertTo-TitleCase -Text 'hello powershell world' | Should -Be 'Hello Powershell World'
    }
}
