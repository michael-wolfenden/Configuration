#requires -version 4.0
#requires -runasadministrator

Set-StrictMode -Version Latest

# //////////////////////////////////////////////////////////////////////
# // GLOBAL VARIABLES
# //////////////////////////////////////////////////////////////////////

$dnsname = "*.localtest.me"
$password = "password"
$exportFilePath = "localtest.me.pfx"
$expiry = Get-Date 2050-01-01

# //////////////////////////////////////////////////////////////////////
# // Begin
# //////////////////////////////////////////////////////////////////////

$securePassword = ConvertTo-SecureString `
    -String $password `
    -Force `
    -AsPlainText

$certificate = @(Get-ChildItem Cert:\LocalMachine\My | Where-Object { $_.Subject -eq "CN=$dnsname" })
if (!($certificate.length -eq 0)) {
    Write-Host "A certificate for '$dnsname' already exists in LocalMachine\My .. deleting" -foregroundcolor magenta
    $certificate | %{Remove-Item -path $_.PSPath -recurse -Force}
}

Write-Host "Generating certificate for $dnsname and importing into into LocalMachine\My" -foregroundcolor yellow

$certificate = New-SelfSignedCertificate `
    -Type "SSLServerAuthentication, CodeSigningCert, DocumentEncryptionCert" `
    -Provider "Microsoft Strong Cryptographic Provider" `
    -DnsName $dnsname `
    -KeyAlgorithm RSA `
    -KeyLength 2048 `
    -KeyExportPolicy ExportableEncrypted `
    -NotBefore (Get-Date) `
    -NotAfter $expiry `
    -CertStoreLocation "cert:LocalMachine\My" `
    -FriendlyName $dnsname `
    -HashAlgorithm SHA256 `
    -KeyUsage DigitalSignature, KeyEncipherment, DataEncipherment `
    -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.1")  
    
$thumbprint = $certificate.Thumbprint

Write-Host "Certificate generated with thumbprint $thumbprint"
Write-Host "Exporting certificate to $exportFilePath"

Export-PfxCertificate `
    -FilePath $exportFilePath `
    -Cert cert:\localmachine\My\$thumbprint `
    -Password $securePassword | Out-Null