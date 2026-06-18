<#
Lesson 04: Conditionals
Learning Objectives:
- Make decisions with if, elseif, and else
- Route logic with switch
- Understand nested conditions and input validation
Estimated Time: 20 minutes
Prerequisites: Lessons 01-03
#>

$temperature = 22
if ($temperature -ge 25) {
    Write-Output 'It is warm outside.'
}
elseif ($temperature -ge 15) {
    Write-Output 'It is mild outside.'
}
else {
    Write-Output 'It is cool outside.'
}

$trafficLight = 'Green'
switch ($trafficLight) {
    'Red' { Write-Output 'Stop.' }
    'Yellow' { Write-Output 'Slow down.' }
    'Green' { Write-Output 'Go.' }
    default { Write-Output 'Unknown light color.' }
}

function Get-Season {
    param(
        [int]$Month
    )

    if ($Month -lt 1 -or $Month -gt 12) {
        throw 'Month must be between 1 and 12.'
    }

    switch ($Month) {
        { $_ -in 3, 4, 5 } { 'Spring'; break }
        { $_ -in 6, 7, 8 } { 'Summer'; break }
        { $_ -in 9, 10, 11 } { 'Autumn'; break }
        default { 'Winter' }
    }
}

function Get-LetterGrade {
    param(
        [int]$Score
    )

    if ($Score -lt 0 -or $Score -gt 100) {
        throw 'Score must be between 0 and 100.'
    }

    if ($Score -ge 90) {
        'A'
    }
    elseif ($Score -ge 80) {
        'B'
    }
    elseif ($Score -ge 70) {
        'C'
    }
    elseif ($Score -ge 60) {
        'D'
    }
    else {
        'F'
    }
}

function Get-DayType {
    param(
        [string]$DayName
    )

    switch ($DayName.ToLowerInvariant()) {
        'saturday' { 'Weekend' }
        'sunday' { 'Weekend' }
        default { 'Weekday' }
    }
}

Write-Output "Month 4 is in $(Get-Season -Month 4)."
Write-Output "A score of 88 is a $(Get-LetterGrade -Score 88)."
Write-Output "Sunday is a $(Get-DayType -DayName 'Sunday')."

# ---- FOLLOW ALONG ----
# TODO 1: Test Get-Season with all four seasons.
# TODO 2: Call Get-LetterGrade with 59, 60, 79, 80, 89, and 90.
# TODO 3: Extend Get-DayType to handle holiday names differently.
# TODO 4: Write a nested if statement that reacts to both weather and temperature.
