# update module path to include module subdirectory
$moduleDir = (join-path $PSScriptRoot modules)
$env:PSModulePath = $moduleDir + ";" + $env:PSModulePath

# Load in support modules
Import-Module "Posh-Git"

# load all scripts from scripts subsirectory
$scriptsDir = (join-path $PSScriptRoot scripts)
Get-ChildItem "${scriptsDir}\*.ps1" | %{.$_} 

# add paths
Add-Path -Directory "D:\utils\git-tfs"
Add-Path -Directory "C:\Program Files\Oracle\VirtualBox"
Add-Path -Directory "C:\Program Files\Git\usr\bin"
Add-Path -Directory "D:\utils"
Add-Path -Directory "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE"

# git posh
$global:GitPromptSettings.BeforeText = '['
$global:GitPromptSettings.AfterText = '] '
$global:GitPromptSettings.BranchAheadStatusBackgroundColor = [ConsoleColor]::Green
$global:GitPromptSettings.WorkingForegroundColor = [ConsoleColor]::Magenta
$global:GitPromptSettings.BranchForegroundColor = [ConsoleColor]::DarkGray

# alias
Set-Alias l Get-ChildItem-Color -option AllScope
Set-Alias ls Get-ChildItem-Format-Wide -option AllScope

## Set environment variables

# Remove lower case version if they exist as certain applications
# are case sensitive
Remove-Item Env:\http_proxy -EA SilentlyContinue
Remove-Item Env:\https_proxy -EA SilentlyContinue

$Env:HTTP_PROXY="10.1.100.50:8080"
$Env:HTTP_PROXYS="10.1.100.50:8080"

## Docker
$Env:DOCKER_TLS_VERIFY = "1"
$Env:DOCKER_HOST = "tcp://192.168.99.100:2376"
$Env:DOCKER_CERT_PATH = "C:\Users\MWolfend\.docker\machine\machines\default"
$Env:DOCKER_MACHINE_NAME = "default"

# Exclude docker machine ip from proxy
$Env:NO_PROXY="192.168.99.100"

$Env:PYTHON="C:\Python27\python.exe"
$Env:CATALINA_HOME="D:\utils\tomcat"

