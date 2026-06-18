<#
Lesson 03: Operators
Learning Objectives:
- Use arithmetic operators for numeric calculations
- Compare values with comparison operators
- Combine logic with -and, -or, and -not
- Work with strings using -like, -match, and -replace
Estimated Time: 20 minutes
Prerequisites: Lessons 01-02
#>

# Arithmetic operators work much like they do in other languages.
Write-Output "7 + 5 = $(7 + 5)"
Write-Output "7 % 5 = $(7 % 5)"

# Comparison operators return True or False.
Write-Output "10 -gt 3 returns $(10 -gt 3)"
Write-Output "5 -eq 5 returns $(5 -eq 5)"

# Logical operators let you combine tests.
$isWeekend = $false
$isSunny = $true
Write-Output "Picnic weather? $($isWeekend -and $isSunny)"

# String operators are great for search and transformation.
$phrase = 'PowerShell is powerful'
Write-Output "Does the phrase match 'power'? $($phrase -match 'power')"
Write-Output "Replace example: $($phrase -replace 'powerful', 'fun')"

function Invoke-Calculate {
    param(
        [double]$A,
        [string]$Operator,
        [double]$B
    )

    switch ($Operator) {
        '+' { return ($A + $B) }
        '-' { return ($A - $B) }
        '*' { return ($A * $B) }
        '/' {
            if ($B -eq 0) {
                throw 'Division by zero is not allowed.'
            }

            return ($A / $B)
        }
        default {
            throw "Unknown operator: $Operator"
        }
    }
}

function Test-IsMatch {
    param(
        [string]$Input,
        [string]$Pattern
    )

    $Input -match $Pattern
}

Write-Output "Calculate example: 9 * 4 = $(Invoke-Calculate -A 9 -Operator '*' -B 4)"
Write-Output "Regex example: $(Test-IsMatch -Input 'cat-123' -Pattern '^cat-\d+$')"

# ---- FOLLOW ALONG ----
# TODO 1: Try each supported operator in Invoke-Calculate.
# TODO 2: Change the regex pattern to test different strings.
# TODO 3: Write a comparison that checks whether your age is at least 18.
# TODO 4: Use -replace to change one word in a sentence.
