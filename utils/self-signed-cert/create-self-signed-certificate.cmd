@ECHO OFF

SET DOMAIN=some.domain.com
SET PASSWORD=password

IF EXIST %DOMAIN%.pfx (
    del %DOMAIN%.pfx
)

:: GENERATE SEVER CERTIFICATE
:: =============================================================================
:: -n "CN=%DOMAIN%"       -> Subject’s certificate name
:: -r                     -> Indicates that this certificate is self signed
:: -pe 	                  -> The generated private key is exportable and can be included in the certificate
:: -a sha512              -> We declare which signature algorithm we will be using (DO NOT use the sha1 algoritm, it is no longer secure)
:: -len 4096 	          -> The generated key length in bits
:: -b 01/01/2015          -> Start of the period where the certificate is valid
:: -e 01/01/2050          -> End of the valid period
:: -sky exchange          -> Indicates that the key is for key encryption and key exchange
:: -eku 1.3.6.1.5.5.7.3.1 -> Server authentication OID (Object Identifier). Identifies that this is an SSL Server certificate.
:: -sv %DOMAIN%.pvk 	  -> The subjects .pvk private key file
:: %DOMAIN%.cer 	      -> The certificate file

makecert.exe ^
	-n "CN=%DOMAIN%" ^
	-r ^
	-pe ^
	-a sha512 ^
	-len 4096 ^
	-b 01/01/2000 ^
	-e 01/01/2050 ^
	-sky exchange ^
	-eku 1.3.6.1.5.5.7.3.1 ^
	-sv %DOMAIN%.pvk ^
	%DOMAIN%.cer

:: -pvk %DOMAIN%.pvk -> The name of the .pvk file
:: -spc %DOMAIN%.cer -> The name of the .cer file
:: -pfx %DOMAIN%.pfx -> The name of the -pfx file
:: -po %PASSWORD%    -> The password for the .pfx file

pvk2pfx.exe ^
	-pvk %DOMAIN%.pvk ^
	-spc %DOMAIN%.cer ^
	-pfx %DOMAIN%.pfx ^
	-po %PASSWORD%

del %DOMAIN%.pvk
del %DOMAIN%.cer