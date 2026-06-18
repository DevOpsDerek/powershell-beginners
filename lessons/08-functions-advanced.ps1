<#
Lesson 08: Functions Advanced
Learning Objectives:
- Turn functions into advanced functions with CmdletBinding
- Validate input with parameter attributes
- Accept pipeline input
- Structure work with Begin, Process, and End blocks
- Add comment-based help for discoverability
Estimated Time: 30 minutes
Prerequisites: Lessons 01-07
#>

# Advanced functions behave more like built-in cmdlets.
# They can support common parameters and richer parameter binding.

function Get-StringInfo {
    <#
    .SYNOPSIS
    Returns details about one or more strings.

    .DESCRIPTION
    Accepts direct input or pipeline input and returns a hashtable
    describing each string.

    .PARAMETER Text
    The string to analyze.

    .EXAMPLE
    Get-StringInfo -Text 'PowerShell basics'

    .EXAMPLE
    'one two', 'three' | Get-StringInfo
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [AllowEmptyString()]
        [string]$Text
    )

    begin {
        $processedCount = 0
    }

    process {
        $processedCount++
        $trimmed = $Text.Trim()
        if ([string]::IsNullOrWhiteSpace($trimmed)) {
            $wordCount = 0
        }
        else {
            $wordCount = ($trimmed -split '\s+').Count
        }

        @{
            Length = $Text.Length
            Upper = $Text.ToUpperInvariant()
            Lower = $Text.ToLowerInvariant()
            WordCount = $wordCount
            IsNullOrEmpty = [string]::IsNullOrEmpty($Text)
        }
    }

    end {
        # The end block is included to demonstrate where cleanup or summary work could go.
        [void]$processedCount
    }
}

function ConvertTo-Slug {
    <#
    .SYNOPSIS
    Converts text into a URL-friendly slug.

    .DESCRIPTION
    Lowercases text, converts spaces and special characters to hyphens,
    collapses repeated hyphens, and trims leading or trailing hyphens.

    .PARAMETER Text
    The text to convert.

    .EXAMPLE
    ConvertTo-Slug -Text 'Hello, PowerShell World!'
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Text
    )

    $slug = $Text.ToLowerInvariant()
    $slug = $slug -replace '[^a-z0-9]+', '-'
    $slug = $slug -replace '-{2,}', '-'
    $slug.Trim('-')
}

# These demos show standard parameter input and pipeline input.
$singleInfo = Get-StringInfo -Text 'Learn PowerShell today'
Write-Output "Word count example: $($singleInfo.WordCount)"

$slugExample = ConvertTo-Slug -Text 'PowerShell for Beginners!'
Write-Output "Slug example: $slugExample"

# ---- FOLLOW ALONG ----
# TODO 1: Pipe three different strings into Get-StringInfo.
# TODO 2: Try ConvertTo-Slug with punctuation and extra spaces.
# TODO 3: Add a ValidateRange attribute to a new numeric parameter.
# TODO 4: Read the help for your functions with Get-Help after dot-sourcing the file.
