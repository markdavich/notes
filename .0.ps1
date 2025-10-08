# Set-Location "C:\Code"

# # Define log directory
# $logDir = "C:\Code\Study\.logs"
# if (!(Test-Path $logDir)) {
#     New-Item -ItemType Directory -Path $logDir | Out-Null
# }

# # Timestamp for this run
# $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# # Find all package.json files, excluding node_modules
# $nodeProjects = Get-ChildItem -Path "." -Recurse -Filter "package.json" |
# Where-Object { $_.FullName -notmatch "\\node_modules\\" }

# # Prepare index content
# $indexLines = @()
# $indexLines += "--- summary of audit"
# $indexLines += "Timestamp: $timestamp"
# $indexLines += "Number of node projects: $($nodeProjects.Count)"
# $indexLines += ""
# $indexLines += "Project Paths:"

# # Track errors
# $errorLog = @()

# foreach ($pkg in $nodeProjects) {
#     $projectDir = $pkg.Directory.FullName
#     $projectName = $pkg.Directory.Name

#     # Define output file paths
#     $jsonOut = Join-Path $logDir "$projectName.npm.audit.$($env:USERNAME).json"
#     $txtOut = Join-Path $logDir "$projectName.npm.audit.$($env:USERNAME).txt"

#     Write-Host "`n[$timestamp] Auditing: $projectName" -ForegroundColor Cyan

#     Push-Location $projectDir
#     try {
#         npm audit --json | Out-File -Encoding UTF8 $jsonOut

#         $rawOutput = npm audit | Out-String
#         $ansiPattern = "`e

# \[[0-9;]*m"
#         $cleanOutput = $rawOutput -replace $ansiPattern, ""
#         $cleanOutput | Set-Content -Encoding UTF8 $txtOut


#         Write-Host "✔ Audit completed for $projectName" -ForegroundColor Green
#     }
#     catch {
#         $errorMsg = "✖ Audit failed for $projectName at $projectDir"
#         Write-Warning $errorMsg
#         $errorLog += $errorMsg
#     }
#     Pop-Location

#     # Add to index
#     $indexLines += $pkg.FullName
# }

# # Write index file
# $indexPath = Join-Path $logDir ".npm.audit.index.$($env:USERNAME).txt"
# $indexLines | Set-Content -Encoding UTF8 $indexPath

# # Write error log if needed
# if ($errorLog.Count -gt 0) {
#     $errorPath = Join-Path $logDir ".npm.audit.errors.$($env:USERNAME).txt"
#     $errorLog | Set-Content -Encoding UTF8 $errorPath
#     Write-Host "`nSome audits failed. See error log at $errorPath" -ForegroundColor Yellow
# }

# Write-Host "`nAll done. Summary written to $indexPath" -ForegroundColor Magenta


# $logDir = "C:\Code\Study\.logs"
# $csvPath = Join-Path $logDir ".npm.audit.$($env:USERNAME).csv"
# $csvRows = @()

# # CSV header
# $csvRows += "ProjectName,Critical,High,Moderate,Low,TotalVulnerabilities,SeverityFlag"

# # Get all audit JSON files
# $jsonFiles = Get-ChildItem -Path $logDir -Filter "*.npm.audit.$($env:USERNAME).json"

# foreach ($file in $jsonFiles) {
#     $json = Get-Content $file.FullName -Raw | ConvertFrom-Json
#     $projectName = $file.BaseName -replace "\.npm\.audit\.$($env:USERNAME)$", ""
#     $vulns = $json.metadata.vulnerabilities
#     if ($vulns) {
#         $crit = $vulns.critical
#         $high = $vulns.high
#         $mod = $vulns.moderate
#         $low = $vulns.low
#         $total = $crit + $high + $mod + $low

#         # Determine severity flag
#         if ($crit -gt 0) { $flag = "CRITICAL" }
#         elseif ($high -gt 0) { $flag = "HIGH" }
#         elseif ($mod -gt 0) { $flag = "MODERATE" }
#         elseif ($low -gt 0) { $flag = "LOW" }
#         else { $flag = "NONE" }

#         $csvRows += "$projectName,$crit,$high,$mod,$low,$total,$flag"
#     }
#     else {
#         $csvRows += "$projectName,0,0,0,0,0,NONE"
#     }
# }

# # Write CSV file
# $csvRows | Set-Content -Encoding UTF8 $csvPath
# Write-Host "`nCSV summary written to $csvPath" -ForegroundColor Green


# Get the system model and manufacturer
$computerSystem = Get-CimInstance -ClassName Win32_ComputerSystem

# Get the BIOS version and manufacturer
$bios = Get-CimInstance -ClassName Win32_BIOS

# Get the system enclosure information, which often contains the service tag
$chassis = Get-CimInstance -ClassName Win32_SystemEnclosure

Write-Host "|||"
Write-Host "|--:|:--|"
Write-Host "|**Model**| ``$($computerSystem.Model)``|"
Write-Host "|**Manufacturer**| ``$($computerSystem.Manufacturer)``|"
Write-Host "|**Service Tag**| ``$($chassis.SerialNumber)``|"
Write-Host "|**BIOS Version**| ``$($bios.SMBIOSBIOSVersion)``|"