param(
  [string]$Exe = "dist\banco.exe"
)

$ErrorActionPreference = "Stop"
$exitCode = 0

try {
  & $Exe
  $exitCode = $LASTEXITCODE
}
catch {
  Write-Host "[INTERRUPCION] Se detectó Ctrl+C o un error: $($_.Exception.Message)" -ForegroundColor Yellow
  $exitCode = 1
}
finally {
  & "$PSScriptRoot\close_chrome_debug.ps1"
}

exit $exitCode