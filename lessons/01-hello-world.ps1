<#
Lesson 01: Hello World & Variables
Learning Objectives:
- Print text with Write-Output and Write-Host
- Store data in variables
- Build strings with interpolation and sub-expressions
- Read and write simple reusable functions
Estimated Time: 15 minutes
Prerequisites: None
#>

# This is a single-line comment. Comments are ignored by PowerShell and help explain code.

# Write-Output sends data to the pipeline. This is usually preferred for scripts and automation.
Write-Output 'Lesson 01: Hello from Write-Output'

# Write-Host writes directly to the console. It is useful for demos and colorful messages.
Write-Host 'Lesson 01: Hello from Write-Host'

# Variables start with a dollar sign.
$firstName = 'Taylor'
$favoriteTool = 'PowerShell'

# String interpolation lets you insert variable values directly into a double-quoted string.
Write-Output "My name is $firstName and I am learning $favoriteTool."

# Use $() when you want to evaluate an expression inside a string.
$numbers = 1, 2, 3
Write-Output "There are $($numbers.Count) numbers in the array."

function Get-Greeting {
    param(
        [string]$Name
    )

    "Hello, $Name!"
}

function Get-FullName {
    param(
        [string]$First,
        [string]$Last
    )

    "$First $Last"
}

# Call the functions so learners can see how parameters and return values work.
$greeting = Get-Greeting -Name 'Student'
Write-Output $greeting

$fullName = Get-FullName -First 'Ada' -Last 'Lovelace'
Write-Output "Full name example: $fullName"

# ---- FOLLOW ALONG ----
# TODO 1: Change $firstName to your own name and re-run the script.
# TODO 2: Call Get-Greeting with three different names.
# TODO 3: Create a new variable for your city and print it with interpolation.
# TODO 4: Update Get-FullName so it trims extra spaces from inputs.
