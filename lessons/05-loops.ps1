<#
Lesson 05: Loops
Learning Objectives:
- Repeat work with for, foreach, while, and do/while loops
- Use break and continue to control loop flow
- Process collections with ForEach-Object in the pipeline
Estimated Time: 25 minutes
Prerequisites: Lessons 01-04
#>

# A for loop is useful when you know how many times you want to repeat something.
for ($index = 1; $index -le 3; $index++) {
    Write-Output "for loop iteration: $index"
}

# foreach loops over each item in a collection.
foreach ($color in 'Red', 'Green', 'Blue') {
    Write-Output "foreach color: $color"
}

# while repeats while a condition is true.
$countdown = 3
while ($countdown -gt 0) {
    Write-Output "while countdown: $countdown"
    $countdown--
}

# do/while runs the body at least once.
$doCounter = 1
do {
    Write-Output "do/while value: $doCounter"
    $doCounter++
} while ($doCounter -le 2)

# ForEach-Object lets you process items flowing through the pipeline.
1..3 | ForEach-Object {
    Write-Output "pipeline item: $_"
}

function Get-Factorial {
    param(
        [int]$N
    )

    if ($N -lt 0) {
        throw 'N must be zero or greater.'
    }

    [long]$result = 1
    for ($i = 2; $i -le $N; $i++) {
        $result *= $i
    }

    $result
}

function Get-FizzBuzz {
    param(
        [int]$Max
    )

    if ($Max -lt 1) {
        return [string[]]@()
    }

    $results = [System.Collections.Generic.List[string]]::new()
    foreach ($number in 1..$Max) {
        if ($number % 15 -eq 0) {
            $results.Add('FizzBuzz')
            continue
        }

        if ($number % 3 -eq 0) {
            $results.Add('Fizz')
            continue
        }

        if ($number % 5 -eq 0) {
            $results.Add('Buzz')
            continue
        }

        $results.Add([string]$number)
    }

    $results.ToArray()
}

function Get-EvenNumbers {
    param(
        [int]$Max
    )

    if ($Max -lt 2) {
        return [int[]]@()
    }

    $results = [System.Collections.Generic.List[int]]::new()
    foreach ($number in 1..$Max) {
        if ($number % 2 -ne 0) {
            continue
        }

        $results.Add($number)
    }

    $results.ToArray()
}

Write-Output "Factorial of 5 is $(Get-Factorial -N 5)"
Write-Output "FizzBuzz to 5: $((Get-FizzBuzz -Max 5) -join ', ')"
Write-Output "Even numbers to 10: $((Get-EvenNumbers -Max 10) -join ', ')"

# ---- FOLLOW ALONG ----
# TODO 1: Change the loop ranges and observe the output.
# TODO 2: Call Get-Factorial with 0, 1, and 6.
# TODO 3: Modify FizzBuzz so multiples of 7 print 'Pop'.
# TODO 4: Write a loop that skips odd numbers and stops after 20.
