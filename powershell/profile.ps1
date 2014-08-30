# Update module path to include mine
$global:PSDefaultModulePath = $env:PSModulePath
$myModulePath = (join-path $PSScriptRoot modules)
$env:PSModulePath = $myModulePath + ";" + $env:PSModulePath

# Load in support modules
Import-Module "Posh-Git"

$env:TERM = "msys"
$env:CHROME_BIN = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

# Prompt
function prompt
{
  Write-Host ("PS " + $(Get-Location) + "`n>") -nonewline
  Write-VcsStatus
  return " "
}

# Aliases
set-alias sudo Invoke-Elevated
set-alias subl 'C:\Program Files\Sublime Text 3\sublime_text.exe'

# Functions
function add-path {
  [CmdletBinding()]
  param (
    [Parameter(
      Mandatory=$True,
      ValueFromPipeline=$True,
      ValueFromPipelineByPropertyName=$True,
      HelpMessage='What directory would you like to add?')]
    [Alias('dir')]
    [string[]]$Directory
  )
 
  PROCESS {
    $Path = $env:PATH.Split(';')
 
    foreach ($dir in $Directory) {
      if ($Path -contains $dir) {
        Write-Verbose "$dir is already present in PATH"
      } else {
        if (-not (Test-Path $dir)) {
          Write-Verbose "$dir does not exist in the filesystem"
        } else {
          $Path += $dir
        }
      }
    }
 
    $env:PATH = [String]::Join(';', $Path)
  }
}

# Paths
add-path -Directory "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE"
add-path -Directory "C:\Program Files (x86)\Git\bin"
add-path -Directory "C:\Users\michael-wolfenden\AppData\Roaming\npm"
add-path -Directory "C:\Program Files\nodejs"
add-path -Directory "C:\utils\"