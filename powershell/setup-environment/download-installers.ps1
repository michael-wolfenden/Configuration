# Configuration
$files = @{
    git = 'https://msysgit.googlecode.com/files/Git-1.9.0-preview20140217.exe'
	linkshellreq = 'http://download.microsoft.com/download/6/B/B/6BB661D6-A8AE-4819-B79F-236472F6070C/vcredist_x64.exe'
	linkshell = 'http://schinagl.priv.at/nt/hardlinkshellext/HardLinkShellExt_X64.exe'
    linq_pad = 'https://www.linqpad.net/GetFile.aspx?LINQPad4Setup.exe'
    consolez = 'https://github.com/cbucher/console/releases/download/1.10.0/ConsoleZ.x86.1.10.0.zip'
    perforce_merge = 'http://www.perforce.com/downloads/perforce/r14.1/bin.ntx64/p4vinst64.exe'
    resharper = 'http://download.jetbrains.com/resharper/ReSharperSetup.8.2.0.2160.msi'
    dot_peek = 'http://download.jetbrains.com/dotpeek/dotPeekSetup-1.1.1.33.msi'
    sourcetree = 'http://downloads.atlassian.com/software/sourcetree/windows/SourceTreeSetup_1.4.1.exe'
    one_password = 'https://d13itkw33a7sus.cloudfront.net/dist/1P/win/1Password-1.0.9.340.exe'
    sevenzip_chrome_dropbox_googledrive = 'http://ninite.com/7zip-chrome-dropbox-googledrive/ninite.exe'
    sys_internals = 'http://download.sysinternals.com/files/SysinternalsSuite.zip'
    sublime_text = 'http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203059%20x64%20Setup.exe'
}

$downloadDir = "~\Downloads"

# Get-WebFile 3.6 (aka wget for PowerShell)
# by Joel Bennett http://poshcode.org/417
function Get-WebFile {
   param( 
      $url = (Read-Host "The URL to download"),
      $fileName = $null,
      [switch]$Passthru,
      [switch]$quiet
   )
   
   $req = [System.Net.HttpWebRequest]::Create($url);
   $res = $req.GetResponse();
 
   if($fileName -and !(Split-Path $fileName)) {
      $fileName = Join-Path (Get-Location -PSProvider "FileSystem") $fileName
   } 
   elseif((!$Passthru -and ($fileName -eq $null)) -or (($fileName -ne $null) -and (Test-Path -PathType "Container" $fileName)))
   {
      [string]$fileName = ([regex]'(?i)filename=(.*)$').Match( $res.Headers["Content-Disposition"] ).Groups[1].Value
      $fileName = $fileName.trim("\/""'")
      if(!$fileName) {
         $fileName = $res.ResponseUri.Segments[-1]
         $fileName = $fileName.trim("\/")
         if(!$fileName) { 
            $fileName = Read-Host "Please provide a file name"
         }
         $fileName = $fileName.trim("\/")
         if(!([IO.FileInfo]$fileName).Extension) {
            $fileName = $fileName + "." + $res.ContentType.Split(";")[0].Split("/")[1]
         }
      }
      $fileName = Join-Path (Get-Location -PSProvider "FileSystem") $fileName
   }
   if($Passthru) {
      $encoding = [System.Text.Encoding]::GetEncoding( $res.CharacterSet )
      [string]$output = ""
   }
 
   if($res.StatusCode -eq 200) {
      [int]$goal = $res.ContentLength
      $reader = $res.GetResponseStream()
      if($fileName) {
         $writer = new-object System.IO.FileStream $fileName, "Create"
      }
      [byte[]]$buffer = new-object byte[] 4096
      [int]$total = [int]$count = 0
      do
      {
         $count = $reader.Read($buffer, 0, $buffer.Length);
         if($fileName) {
            $writer.Write($buffer, 0, $count);
         } 
         if($Passthru){
            $output += $encoding.GetString($buffer,0,$count)
         } elseif(!$quiet) {
            $total += $count
            if($goal -gt 0) {
               Write-Progress "Downloading $url" "Saving $total of $goal" -id 0 -percentComplete (($total/$goal)*100)
            } else {
               Write-Progress "Downloading $url" "Saving $total bytes..." -id 0
            }
         }
      } while ($count -gt 0)
      
      $reader.Close()
      if($fileName) {
         $writer.Flush()
         $writer.Close()
      }
      if($Passthru){
         $output
      }
   }
   $res.Close(); 
   if($fileName) {
      ls $fileName
   }
}

if ((test-path $downloadDir) -eq $false) {
	mkdir $downloadDir | out-null
}

push-location $downloadDir

$dlfiles = @()
$files.GetEnumerator() | % {
	$dlfiles += get-webfile $_.Value
}

pop-location

$dlfiles
