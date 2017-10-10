#requires -version 4.0
#requires -runasadministrator

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# //////////////////////////////////////////////////////////////////////
# // GLOBAL VARIABLES
# //////////////////////////////////////////////////////////////////////

$sslCertificateName = "localtest.me.pfx"
$hostname = "*.localtest.me"
$sslCertificatePath = [IO.Path]::Combine($PSSCriptRoot, $sslCertificateName)
$sslCertificatePassword = ConvertTo-SecureString -String "password" -Force -AsPlainText

# //////////////////////////////////////////////////////////////////////
# // INITIALISE CERTIFICATES
# //////////////////////////////////////////////////////////////////////

Write-Host "# //////////////////////////////////////////////////////////////////////"
Write-Host "# // IMPORT CERTIFICATES"
Write-Host "# //////////////////////////////////////////////////////////////////////"
Write-Host

if (!(Test-Path -Path $sslCertificatePath))
{
    throw "The certificate could not be found at '$sslCertificatePath'"
}

$personalCertificates = @(Get-ChildItem Cert:\LocalMachine\My | Where-Object {$_.Subject -eq "CN=$hostname"})
if (!($personalCertificates.length -eq 0)) {
    Write-Host "A certificate for '$hostname' already exists in LocalMachine\My .. deleting" -foregroundcolor magenta
    $personalCertificates | %{Remove-Item -path $_.PSPath -recurse -Force}
}

Write-Host "Importing $sslCertificateName into LocalMachine\My" -foregroundcolor yellow

Import-PfxCertificate -FilePath $sslCertificatePath `
                      -CertStoreLocation Cert:\LocalMachine\My `
                      -Password $sslCertificatePassword `
                      -Exportable | Out-Null

$personalCertificates = @(Get-ChildItem Cert:\LocalMachine\My | Where-Object {$_.Subject -eq "CN=$hostname"})
if ($personalCertificates.length -eq 0) {
  throw "Importing $sslCertificateName failed !! "
}

Write-Host ">>> done" -foregroundcolor green
Write-Host

$rootCertificates = @(Get-ChildItem Cert:\LocalMachine\Root | Where-Object {$_.Subject -eq "CN=$hostname"})
if (!($rootCertificates.length -eq 0)) {
    Write-Host "A certificate for '$hostname' already exists in LocalMachine\Root .. deleting" -foregroundcolor magenta
    $rootCertificates | %{Remove-Item -path $_.PSPath -recurse -Force}
}

Write-Host "Importing $sslCertificateName into LocalMachine\Root" -foregroundcolor yellow

Import-PfxCertificate -FilePath $sslCertificatePath `
                      -CertStoreLocation Cert:\LocalMachine\Root `
                      -Password $sslCertificatePassword `
                      -Exportable | Out-Null

$rootCertificates = @(Get-ChildItem Cert:\LocalMachine\Root | Where-Object {$_.Subject -eq "CN=$hostname"})
if ($rootCertificates.length -eq 0) {
  throw "Importing $sslCertificateName failed !! "
}

Write-Host ">>> done" -foregroundcolor green
Write-Host

Write-Host "Granting everyone permissions to $sslCertificateName" -foregroundcolor yellow

# Specify the user, the permissions and the permission type
$permission = "Everyone","FullControl","Allow"
$accessRule = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permission;

# Location of the machine related keys
$keyPath = $env:ProgramData + "\Microsoft\Crypto\RSA\MachineKeys\";
$keyName = $personalCertificates.PrivateKey.CspKeyContainerInfo.UniqueKeyContainerName;
$keyFullPath = $keyPath + $keyName;

try
{
	Write-Host "Granting access to $keyFullPath"

	# Get the current acl of the private key
	$acl = (Get-Item $keyFullPath).GetAccessControl()

	# Add the new ace to the acl of the private key
	$acl.AddAccessRule($accessRule);

	# Write back the new acl
	Set-Acl -Path $keyFullPath -AclObject $acl;
}
catch
{
	throw $_;
}

Write-Host ">>> done" -foregroundcolor green
Write-Host