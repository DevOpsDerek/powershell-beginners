<#
Lesson 02: Data Types
Learning Objectives:
- Work with strings, integers, doubles, booleans, and datetimes
- Inspect types with .GetType()
- Understand automatic type conversion
- Use explicit casting for predictable results
Estimated Time: 20 minutes
Prerequisites: Lesson 01
#>

# PowerShell can store many types of data in variables.
$language = [string]'PowerShell'
$year = [int]2026
$version = [double]7.5
$isFun = [bool]$true
$today = [datetime]'2026-06-18'

Write-Output "The variable `$language contains a $($language.GetType().Name)."
Write-Output "The variable `$year contains a $($year.GetType().Name)."
Write-Output "The variable `$today contains a $($today.GetType().Name)."

# Automatic conversion happens when PowerShell can safely interpret a value.
# Here the integer is on the left, so PowerShell converts the string '42' into a number first.
$automaticNumber = '42'
$automaticResult = 8 + $automaticNumber
Write-Output "Automatic conversion example: 8 + '42' becomes $automaticResult"

# Explicit casting is clearer and safer in real scripts.
$priceText = '19.95'
$priceValue = [double]$priceText
Write-Output "Explicit cast example: $priceText becomes a $($priceValue.GetType().Name)"

function ConvertTo-Fahrenheit {
    param(
        [double]$Celsius
    )

    ($Celsius * 9 / 5) + 32
}

function Get-TypeName {
    param(
        $Value
    )

    $Value.GetType().Name
}

$boilingPoint = ConvertTo-Fahrenheit -Celsius 100
Write-Output "100 Celsius is $boilingPoint Fahrenheit"
Write-Output "Type of `$isFun: $(Get-TypeName -Value $isFun)"

# ---- FOLLOW ALONG ----
# TODO 1: Create one variable of each type shown in this lesson.
# TODO 2: Cast the string '3.14159' to a double.
# TODO 3: Use Get-TypeName on an array such as 1, 2, 3.
# TODO 4: Convert 0, 20, and 37 Celsius to Fahrenheit.
