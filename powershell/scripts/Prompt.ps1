function Prompt
{
    $host.UI.RawUI.WindowTitle = "$ENV:USERNAME@$ENV:COMPUTERNAME - $(Get-Location)"
    
    Write-Host "[$ENV:USERNAME@$ENV:COMPUTERNAME]" -NoNewline -ForegroundColor Yellow
    Write-Host " :: " -NoNewline -ForegroundColor DarkGray
    Write-Host $(Get-Location) -ForegroundColor Green
    Write-Host "$(Write-VcsStatus)>=" -NoNewline -ForegroundColor Gray
    return " "
}