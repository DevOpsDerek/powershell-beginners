<#
Lesson 06: Collections
Learning Objectives:
- Store multiple values in arrays and access them by index
- Count items and use array operators
- Create and merge hashtables
- Understand when a resizable collection like ArrayList is useful
Estimated Time: 25 minutes
Prerequisites: Lessons 01-05
#>

# Arrays are ordered collections.
$planets = @('Mercury', 'Venus', 'Earth')
Write-Output "The first planet is $($planets[0])."
Write-Output "There are $($planets.Count) planets in the array."

# Hashtables store key/value pairs.
$student = @{
    Name = 'Jordan'
    Score = 93
}
Write-Output "Hashtable keys: $($student.Keys -join ', ')"
Write-Output "Hashtable values: $($student.Values -join ', ')"

# ArrayList can grow more easily than a fixed array.
$shoppingList = [System.Collections.ArrayList]::new()
[void]$shoppingList.Add('Milk')
[void]$shoppingList.Add('Bread')
Write-Output "ArrayList items: $($shoppingList -join ', ')"

function Get-ArrayStats {
    param(
        [int[]]$Numbers
    )

    if (-not $Numbers -or $Numbers.Count -eq 0) {
        throw 'Numbers cannot be empty.'
    }

    $sum = ($Numbers | Measure-Object -Sum).Sum
    $average = ($Numbers | Measure-Object -Average).Average
    $minimum = ($Numbers | Measure-Object -Minimum).Minimum
    $maximum = ($Numbers | Measure-Object -Maximum).Maximum

    @{
        Sum = [int]$sum
        Average = [double]$average
        Min = [int]$minimum
        Max = [int]$maximum
    }
}

function Find-InArray {
    param(
        [object[]]$Array,
        $Item
    )

    $Array -contains $Item
}

function Merge-Hashtables {
    param(
        [hashtable]$Base,
        [hashtable]$Override
    )

    $merged = @{}

    foreach ($key in $Base.Keys) {
        $merged[$key] = $Base[$key]
    }

    foreach ($key in $Override.Keys) {
        $merged[$key] = $Override[$key]
    }

    $merged
}

$stats = Get-ArrayStats -Numbers @(10, 20, 30)
Write-Output "Array stats sum: $($stats.Sum), average: $($stats.Average)"
Write-Output "Find Earth in planets: $(Find-InArray -Array $planets -Item 'Earth')"
Write-Output "Merged hashtable score: $((Merge-Hashtables -Base $student -Override @{ Score = 100 }).Score)"

# ---- FOLLOW ALONG ----
# TODO 1: Create an array of your three favorite foods.
# TODO 2: Add a new key to the $student hashtable.
# TODO 3: Call Get-ArrayStats with five numbers.
# TODO 4: Merge two hashtables that both contain a Name key.
