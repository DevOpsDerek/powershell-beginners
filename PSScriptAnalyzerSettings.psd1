@{
    IncludeDefaultRules = $true
    ExcludeRules        = @(
        # Lessons use Write-Host intentionally for colorful console demos.
        'PSAvoidUsingWriteHost',
        # Plural function names (Get-EvenNumbers, Merge-Hashtables) are semantically correct here.
        'PSUseSingularNouns',
        # ShouldProcess is an advanced topic introduced after New-/Export- are taught.
        'PSUseShouldProcessForStateChangingFunctions',
        # OutputType attributes are beyond beginner scope.
        'PSUseOutputTypeCorrectly'
    )
}
