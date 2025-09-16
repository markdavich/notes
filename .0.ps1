$baseKey = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search\PreventIndexingCertainPaths"

New-Item -Path $baseKey -Force | Out-Null

$patterns = @(
    "file:///*\.git\*",
    "file:///*\node_modules\*",
    "file:///*\bin\*",
    "file:///*\obj\*",
    "file:///*\.vs\*",
    "file:///*\packages\*"
)

foreach ($pattern in $patterns) {
    New-ItemProperty -Path $baseKey -Name $pattern -Value $pattern -PropertyType String -Force
}

Write-Host "Wildcard exclusions added to registry."
