# Prefer a system installation; fall back to the project-local BSL v1.3.3 runtime.
$projectRoot = Split-Path $PSScriptRoot -Parent
Set-Location -LiteralPath $projectRoot
$runtimeDirectory = Join-Path $projectRoot '.tools/bsl/Bonezegei'
if (Test-Path -LiteralPath (Join-Path $runtimeDirectory 'bzg.exe')) {
    $env:PATH = $runtimeDirectory + ';' + $env:PATH
}
if (-not (Get-Command bzg -ErrorAction SilentlyContinue)) {
    throw 'Install Bonezegei Scripting Language v1.3.3, then reopen your terminal.'
}
bonezegei -v
if (-not (Test-Path -LiteralPath 'lib/http.bzg')) {
    bzg install
    if ($LASTEXITCODE -ne 0) { throw 'Dependency installation failed.' }
}
bzg run
