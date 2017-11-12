# update module path to include module subdirectory
$moduleDir = (join-path $PSScriptRoot modules)
$env:PSModulePath = $moduleDir + ";" + $env:PSModulePath

# load in support modules
Import-Module "posh-git"
Import-Module "oh-my-posh"
Import-Module "z"

# load all scripts from scripts subdirectory
$scriptsDir = (join-path $PSScriptRoot scripts)
Get-ChildItem "${scriptsDir}\*.ps1" | %{.$_}

# add paths
Add-Path -Directory "D:\utils\asmspy"
Add-Path -Directory "D:\utils\ripgrep"
Add-Path -Directory "C:\Program Files (x86)\GitExtensions"

# load ripgrep module
. _rg.ps1