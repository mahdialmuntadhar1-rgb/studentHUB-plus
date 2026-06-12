# PRODUCTION FRONTEND DEPLOY - DANGEROUS
# Only run after staging has been checked visually.
# This updates: https://idiot.mahdialmuntadhar1.workers.dev/

$RepoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $RepoRoot

Write-Host "WARNING: This will deploy to PRODUCTION frontend: idiot" -ForegroundColor Red
Write-Host "Correct production URL: https://idiot.mahdialmuntadhar1.workers.dev/" -ForegroundColor Yellow
Write-Host ""

$branch = git branch --show-current
Write-Host "Current branch: $branch" -ForegroundColor Cyan
git status --short

Write-Host ""
$confirm = Read-Host "Type DEPLOY IDIOT to continue"

if ($confirm -ne "DEPLOY IDIOT") {
  Write-Host "Cancelled. Production frontend was not touched." -ForegroundColor Green
  exit 1
}

Write-Host ""
$confirm2 = Read-Host "Type YES I CHECKED STAGING to deploy production"

if ($confirm2 -ne "YES I CHECKED STAGING") {
  Write-Host "Cancelled. Production frontend was not touched." -ForegroundColor Green
  exit 1
}

npm run build
npx wrangler deploy --name idiot --assets ./dist --compatibility-date 2026-05-26 --compatibility-flag nodejs_compat

Write-Host ""
Write-Host "Production frontend deployed:" -ForegroundColor Green
Write-Host "https://idiot.mahdialmuntadhar1.workers.dev/"
