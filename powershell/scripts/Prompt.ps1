# function Prompt
# {
#     # # Check for Administrator elevation
#     # $identity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
#     # $principle = New-Object System.Security.Principal.WindowsPrincipal($identity)
#     # $administratorRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator
#     # $isAdministrator = $principle.IsInRole($administratorRole)

#     # Set Window Title
#     $host.UI.RawUI.WindowTitle = "$ENV:USERNAME@$ENV:COMPUTERNAME - $(Get-Location)"
    
#     Write-Host "[$ENV:USERNAME@$ENV:COMPUTERNAME]" -NoNewline -ForegroundColor Yellow
#     Write-Host " :: " -NoNewline -ForegroundColor DarkGray
#     Write-Host $(Get-Location) -ForegroundColor Green
#     Write-Host "$(Write-VcsStatus)>=" -NoNewline -ForegroundColor Gray
#     return " "
# }
function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    Write-Host

    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor

    if (Test-Administrator) {  # Use different username if elevated
        Write-Host "(Elevated) " -NoNewline -ForegroundColor White
    }

    Write-Host "$ENV:USERNAME@" -NoNewline -ForegroundColor DarkYellow
    Write-Host "$ENV:COMPUTERNAME" -NoNewline -ForegroundColor Magenta

    if ($s -ne $null) {  # color for PSSessions
        Write-Host " (`$s: " -NoNewline -ForegroundColor DarkGray
        Write-Host "$($s.Name)" -NoNewline -ForegroundColor Yellow
        Write-Host ") " -NoNewline -ForegroundColor DarkGray
    }

    Write-Host " : " -NoNewline -ForegroundColor DarkGray
    Write-Host $($(Get-Location) -replace "C:\\Users\\MWolfend", "~") -NoNewline -ForegroundColor Blue
    Write-Host " : " -NoNewline -ForegroundColor DarkGray
    Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor DarkMagenta
    Write-Host " : " -NoNewline -ForegroundColor DarkGray

    $global:LASTEXITCODE = $realLASTEXITCODE

    Write-VcsStatus

    Write-Host ""

    return "> "
}