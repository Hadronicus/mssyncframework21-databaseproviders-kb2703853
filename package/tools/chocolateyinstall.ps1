$ErrorActionPreference = 'Stop'; # stop on all errors
$packageName           = 'mssyncframework21-databaseproviders-kb2703853'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

if([System.IntPtr]::Size -ne 4)
{
    $fileLocation = Join-Path $toolsDir 'DatabaseProviders-KB2703853-v3.1-x64-ENU.msi'
    $checksum     = '7B636BB0213DF2206904334C8976C57CCA0D668CA5C72339C42D5FFAF8A42AD4E841E8D78A4E3207B1FB526BC7DED2F6AC47DD0A0872AA301F668E7BCCCB1719'
    $checksumType = 'sha512'
}
else
{
    $fileLocation = Join-Path $toolsDir 'DatabaseProviders-KB2703853-v3.1-x86-ENU.msi'
    $checksum     = '62E45323CB49A0E2D9C9D827746BBE93EC3C5F4EFF45DF216079430653A099DA8896DF608549012276EDBB0385F169B6DECB6D67D90ECB2B853F26D831D25E09'
    $checksumType = 'sha512'
}

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  file          = $fileLocation
  softwareName  = 'mssyncframework21-databaseproviders-kb2703853*'
  checksum      = $checksum
  checksumType  = $checksumType
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs