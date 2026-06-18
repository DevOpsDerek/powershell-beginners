<#
Lesson 07: Functions Basics
Learning Objectives:
- Define functions with parameters and return values
- Use default parameter values
- Understand local scope inside functions
- Call functions with positional and named arguments
Estimated Time: 25 minutes
Prerequisites: Lessons 01-06
#>

# Functions are named blocks of reusable code.
function Get-CircleArea {
    param(
        [double]$Radius
    )

    [Math]::PI * [Math]::Pow($Radius, 2)
}

function New-Rectangle {
    param(
        [double]$Width,
        [double]$Height
    )

    $area = $Width * $Height
    $perimeter = 2 * ($Width + $Height)

    @{
        Width = $Width
        Height = $Height
        Area = $area
        Perimeter = $perimeter
    }
}

function ConvertTo-TitleCase {
    param(
        [string]$Text
    )

    $culture = [System.Globalization.CultureInfo]::CurrentCulture
    $culture.TextInfo.ToTitleCase($Text.ToLower())
}

# Default values can make functions easier to use.
function Get-Message {
    param(
        [string]$Name = 'friend'
    )

    "Hello, $Name"
}

# Variables defined inside a function stay local unless you deliberately scope them elsewhere.
$outsideValue = 'outside'
Write-Output "Outside the function, the value is $outsideValue."
Write-Output "Circle area for radius 2: $(Get-CircleArea -Radius 2)"
Write-Output "Rectangle area example: $((New-Rectangle -Width 3 -Height 4).Area)"
Write-Output "Title case example: $(ConvertTo-TitleCase -Text 'welcome to powershell')"
Write-Output "Default parameter example: $(Get-Message)"
Write-Output "Positional parameter example: $(Get-Message 'student')"

# ---- FOLLOW ALONG ----
# TODO 1: Call Get-CircleArea with 1, 5, and 10.
# TODO 2: Create rectangles with different sizes and inspect the returned hashtable.
# TODO 3: Change ConvertTo-TitleCase to use a specific culture.
# TODO 4: Add a function that calculates the area of a triangle.
