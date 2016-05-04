# update module path to include module subdirectory
$moduleDir = (join-path $PSScriptRoot modules)
$env:PSModulePath = $moduleDir + ";" + $env:PSModulePath

# load in support modules
Import-Module "Posh-Git"

# load all scripts from scripts subdirectory
$scriptsDir = (join-path $PSScriptRoot scripts)
Get-ChildItem "${scriptsDir}\*.ps1" | %{.$_} 

# add paths
Add-Path -Directory "D:\utils"

# git posh
$global:GitPromptSettings.BeforeText = ""
$global:GitPromptSettings.AfterText = ""

