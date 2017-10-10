param([switch]$WhatIf = $false)

Install-Module posh-git

# Adapted from http://www.west-wind.com/Weblog/posts/197245.aspx
function Get-FileEncoding($Path) {
    $bytes = [byte[]](Get-Content $Path -Encoding byte -ReadCount 4 -TotalCount 4)

    if(!$bytes) { return 'utf8' }

    switch -regex ('{0:x2}{1:x2}{2:x2}{3:x2}' -f $bytes[0],$bytes[1],$bytes[2],$bytes[3]) {
        '^efbbbf'   { return 'utf8' }
        '^2b2f76'   { return 'utf7' }
        '^fffe'     { return 'unicode' }
        '^feff'     { return 'bigendianunicode' }
        '^0000feff' { return 'utf32' }
        default     { return 'ascii' }
    }
}

Write-Host "Removing posh-git import statement from the profile (we have our own)..."
if(Select-String -Path $PROFILE -Pattern "^.*profile.example.ps1'") {
    $content = Get-Content $PROFILE
    $content | Where-Object {$_ -notmatch 'profile.example.ps1' -and $_ -notmatch '# Load posh-git example profile'} | Out-File $PROFILE -Encoding (Get-FileEncoding $PROFILE)
}

# Update the profile to include oh-my-posh (taken from posh-git install.ps1: https://github.com/dahlbyk/posh-git/blob/master/install.ps1)
$importLine = "Import-Module oh-my-posh"
if(Select-String -Path $PROFILE -Pattern $importLine -Quiet -SimpleMatch) {
    Write-Host "It seems oh-my-posh is already installed..."
    return
}

Write-Host "Adding oh-my-posh to profile..." 
@"

# Import oh-my-posh and dependecies
Import-Module -Name posh-git -ErrorAction SilentlyContinue
$importLine

"@ | Out-File $PROFILE -Append -WhatIf:$WhatIf -Encoding (Get-FileEncoding $PROFILE)

Write-Host 'oh-my-posh has been installed, all modules should be loaded.'
Write-Host 'If not, please reload your profile for the changes to take effect:'
Write-Host '    . $PROFILE'
Write-Host ''
Write-Host 'To see the awesome prompts, make sure to use PowerShell in ConEmu and make use of the powerline fonts'.
Write-Host 'You can install ConEmu using chocolatey:'
Write-Host '    choco install conemu'
Write-Host ''
Write-Host 'To install the powerline fonts, you can abuse PsGet:'
Write-Host '    Install-Module -ModuleUrl https://github.com/powerline/fonts/archive/master.zip'
Write-Host ''
Write-Host 'or clone the repository and run install.ps1 yourself:'
Write-Host '    git clone git@github.com:powerline/fonts.git'
Write-Host ''