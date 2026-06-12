# SAFE BACKEND DEPLOY
# This deploys only rafid-api backend.
# It does NOT touch frontend.

$RepoRoot = Split-Path -Parent $PSScriptRoot
$BackendDir = Join-Path $RepoRoot "backend"
Set-Location $BackendDir

npx tsc --noEmit
npx wrangler deploy .\src\index.ts --name rafid-api --config .\wrangler.toml

Write-Host ""
Write-Host "Backend deployed:" -ForegroundColor Green
Write-Host "https://rafid-api.mahdialmuntadhar1.workers.dev"
