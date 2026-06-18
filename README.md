# Getting Started with PowerShell

[![CI](https://github.com/DevOpsDerek/powershell-beginners/actions/workflows/ci.yml/badge.svg)](https://github.com/DevOpsDerek/powershell-beginners/actions/workflows/ci.yml)

A beginner-friendly, production-quality PowerShell course that teaches the fundamentals through progressive lessons, reusable functions, and automated tests.

## Course Overview

This course is designed for people who are new to PowerShell and want hands-on practice. Each lesson introduces a focused set of concepts, includes heavily commented examples, defines testable functions, and ends with follow-along exercises.

## Learning Objectives

By the end of this course, you will be able to:

- Run PowerShell scripts and commands confidently
- Work with variables, strings, and core data types
- Use operators, conditionals, and loops
- Manipulate arrays and hashtables
- Write reusable functions with parameters and return values
- Build advanced functions that accept pipeline input
- Handle errors predictably with try/catch/finally
- Read and write CSV, JSON, and text files
- Validate your work with Pester and PSScriptAnalyzer

## Prerequisites

- PowerShell 7 or later
- A code editor such as **Visual Studio Code**
- Recommended: the **PowerShell** extension for VS Code

## Install Pester and PSScriptAnalyzer

Open PowerShell and run:

```powershell
Install-Module Pester -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module PSScriptAnalyzer -Scope CurrentUser -Force
```

If prompted to trust the PSGallery repository, answer **Yes**.

## Directory Structure

```text
powershell-beginners/
├── README.md
├── PSScriptAnalyzerSettings.psd1
├── lint.ps1
├── run-tests.ps1
├── lessons/
└── tests/
```

## Running a Lesson

From the project folder:

```powershell
cd ~/powershell-beginners
pwsh ./lessons/01-hello-world.ps1
```

You can also dot-source a lesson to load its functions into your current session:

```powershell
. ./lessons/01-hello-world.ps1
Get-Greeting -Name 'Ada'
```

## Running the Test Suite

```powershell
pwsh ./run-tests.ps1
```

## Running the Linter

```powershell
pwsh ./lint.ps1
```

## Lesson Summary

| # | Title | Key Concepts |
|---|-------|--------------|
| 01 | Hello World & Variables | Write-Output, Write-Host, variables, interpolation, comments |
| 02 | Data Types | strings, numbers, booleans, datetimes, casting |
| 03 | Operators | arithmetic, comparison, logical, regex, replace |
| 04 | Conditionals | if/elseif/else, switch, nested checks |
| 05 | Loops | for, foreach, while, do/while, break, continue, pipeline processing |
| 06 | Collections | arrays, indexing, count, hashtables, ArrayList |
| 07 | Functions Basics | parameters, return values, defaults, scope |
| 08 | Functions Advanced | CmdletBinding, validation, pipeline input, Begin/Process/End |
| 09 | Error Handling | try/catch/finally, throw, Write-Error, JSON parsing |
| 10 | Capstone: File I/O | text files, CSV, JSON, mini grade tracker |

## Tips for Beginners

- Type commands manually first, then copy/paste later.
- Read comments in each lesson carefully; they explain both *what* and *why*.
- Run the Pester tests after changing a function to confirm behavior.
- Use `Get-Help <command>` often. Example: `Get-Help Get-Content -Full`
- Experiment in small steps instead of writing large scripts all at once.
- If a script fails, read the full error message before changing code.

Happy scripting!
