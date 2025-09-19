
# Lindsay, change the path below to the real ijos.exe path
$ijosPath = "C:\Path\To\YourApp.exe"

Add-Type -AssemblyName System.Reflection
$assembly = [System.Reflection.Assembly]::LoadFile($ijosPath)
$debugAttr = $assembly.GetCustomAttributes($false) | Where-Object { $_.GetType().FullName -eq "System.Diagnostics.DebuggableAttribute" }
$debugAttr | Format-List *