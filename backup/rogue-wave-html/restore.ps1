$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Resolve-Path (Join-Path $scriptDir "..\..")
$partsDir = Join-Path $scriptDir "parts"
$outFile = Join-Path $repoRoot "rogue-wave.html"
$b64 = (Get-ChildItem -LiteralPath $partsDir -Filter "rogue-wave.html.b64.part*" | Sort-Object Name | ForEach-Object { [System.IO.File]::ReadAllText($_.FullName) }) -join ""
$bytes = [Convert]::FromBase64String($b64)
[System.IO.File]::WriteAllBytes($outFile, $bytes)
$hash = (Get-FileHash -Algorithm SHA256 -LiteralPath $outFile).Hash
if ($hash -ne "3B379D08D6EBEE5DDCD010CB1556421C0B65BA81AEA03F2FB4AD36AA6B844FFB") {
  throw "Restored hash mismatch: $hash"
}
Write-Host "Restored rogue-wave.html ($($bytes.Length) bytes)"
