<#
Lesson 10: Capstone: File I/O
Learning Objectives:
- Check file paths and create files and folders when needed
- Read, write, append, and remove text files
- Export and import structured data with CSV
- Convert PowerShell objects to and from JSON
- Build a mini student-grade tracker
Estimated Time: 35 minutes
Prerequisites: Lessons 01-09
#>

# File I/O means reading from and writing to files.
$demoFolder = Join-Path -Path ([System.IO.Path]::GetTempPath()) -ChildPath 'powershell-beginners-demo'
if (-not (Test-Path -Path $demoFolder)) {
    New-Item -Path $demoFolder -ItemType Directory | Out-Null
}

$notesPath = Join-Path -Path $demoFolder -ChildPath 'notes.txt'
Set-Content -Path $notesPath -Value 'Lesson 10 started.'
Add-Content -Path $notesPath -Value 'Learning file input and output.'
$notes = Get-Content -Path $notesPath
Write-Output "Text file lines: $($notes.Count)"

# JSON is useful for nested data.
$studentPreview = @{
    Name = 'Jordan'
    Score = 91
}
$studentJson = $studentPreview | ConvertTo-Json
$studentFromJson = $studentJson | ConvertFrom-Json
Write-Output "JSON example student: $($studentFromJson.Name)"

function New-StudentRecord {
    param(
        [string]$Name,
        [int]$Score
    )

    if ($Score -lt 0 -or $Score -gt 100) {
        throw 'Score must be between 0 and 100.'
    }

    $grade = if ($Score -ge 90) {
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

    @{
        Name = $Name
        Score = $Score
        Grade = $grade
        Timestamp = [datetime]::UtcNow
    }
}

function Export-GradeReport {
    param(
        [hashtable[]]$Students,
        [string]$Path
    )

    $rows = foreach ($student in $Students) {
        [pscustomobject]@{
            Name = $student.Name
            Score = $student.Score
            Grade = $student.Grade
            Timestamp = $student.Timestamp
        }
    }

    $rows | Export-Csv -Path $Path -NoTypeInformation
    $Path
}

function Import-GradeReport {
    param(
        [string]$Path
    )

    $rows = Import-Csv -Path $Path
    $students = [System.Collections.Generic.List[hashtable]]::new()

    foreach ($row in $rows) {
        $students.Add(@{
            Name = $row.Name
            Score = [int]$row.Score
            Grade = $row.Grade
            Timestamp = $row.Timestamp
        })
    }

    $students.ToArray()
}

function Get-ClassAverage {
    param(
        [hashtable[]]$Students
    )

    if (-not $Students -or $Students.Count -eq 0) {
        throw 'Students cannot be empty.'
    }

    $scores = foreach ($student in $Students) {
        [double]$student.Score
    }

    ($scores | Measure-Object -Average).Average
}

$demoReportPath = Join-Path -Path $demoFolder -ChildPath 'grades.csv'
$demoStudents = @(
    (New-StudentRecord -Name 'Ava' -Score 95)
    (New-StudentRecord -Name 'Noah' -Score 82)
)
Export-GradeReport -Students $demoStudents -Path $demoReportPath | Out-Null
$importedStudents = Import-GradeReport -Path $demoReportPath
Write-Output "Class average example: $(Get-ClassAverage -Students $importedStudents)"

Remove-Item -Path $demoReportPath -ErrorAction SilentlyContinue
Remove-Item -Path $notesPath -ErrorAction SilentlyContinue
Remove-Item -Path $demoFolder -ErrorAction SilentlyContinue

# ---- FOLLOW ALONG ----
# TODO 1: Create three student records with different scores.
# TODO 2: Export a report and open the CSV file in a text editor.
# TODO 3: Import the report and calculate the class average.
# TODO 4: Convert one student record to JSON and back again.
