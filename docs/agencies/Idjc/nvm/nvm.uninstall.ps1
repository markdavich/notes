using module Bop.U.FileSystem
using module Bop.U.Roles
using module Bop.U.Logger
using module Bop.U.Variable

Add-Local -Name "AdminExtension" -Value ".admin.ps1"

[Logger] $Log = [Logger]::new()

$MyFile = (Get-Item -Path $PSCommandPath)
$AdminFile = Get-CompanionFile -File $myFile -CompanionExtension $AdminExtension
$MyUser = $env:USERNAME

function Uninstall-Nvm {
    # Build argument list for the admin script
    $argumentList = @(
        '-File', $AdminFile.FullName,
        '-NormalUserName', $MyUser
    )

    # Launch elevated PowerShell to run the admin script
    Start-Process powershell.exe -Verb RunAs -ArgumentList $argumentList
}

function Main {
    try {
        Confirm-NotElevated
    }
    catch {
        $Log.Error($_)
    }
}

Main