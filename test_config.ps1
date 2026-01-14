# ========================================
# Odoo Setup - Quick Configuration Test
# ========================================
# Run this script to verify your configuration is correct

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  ODOO SETUP - CONFIGURATION TEST" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Load configuration
Write-Host "Loading configuration..." -ForegroundColor Yellow
. "$PSScriptRoot\config.ps1"
Write-Host ""

# Test configuration
Write-Host "Testing configuration..." -ForegroundColor Yellow
Write-Host ""

$allGood = $true

# Check Python
if (Test-Path $PYTHON_PATH) {
    Write-Host "[OK] Python found at: $PYTHON_PATH" -ForegroundColor Green
}
else {
    Write-Host "[ERROR] Python NOT found at: $PYTHON_PATH" -ForegroundColor Red
    $allGood = $false
}

# Check Odoo binary
if (Test-Path $ODOO_BIN) {
    Write-Host "[OK] Odoo binary found at: $ODOO_BIN" -ForegroundColor Green
}
else {
    Write-Host "[ERROR] Odoo binary NOT found at: $ODOO_BIN" -ForegroundColor Red
    $allGood = $false
}

# Check Odoo config
if (Test-Path $ODOO_CONF) {
    Write-Host "[OK] Odoo config found at: $ODOO_CONF" -ForegroundColor Green
}
else {
    Write-Host "[ERROR] Odoo config NOT found at: $ODOO_CONF" -ForegroundColor Red
    $allGood = $false
}

# Check if log file exists (it's OK if it doesn't)
if (Test-Path $ODOO_LOG) {
    Write-Host "[OK] Odoo log file exists at: $ODOO_LOG" -ForegroundColor Green
}
else {
    Write-Host "[INFO] Odoo log file will be created at: $ODOO_LOG" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan

if ($allGood) {
    Write-Host "  CONFIGURATION IS VALID!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Run odoo_hotkeys.ahk to enable global hotkeys" -ForegroundColor White
    Write-Host "2. Press Ctrl+Alt+S to start Odoo" -ForegroundColor White
    Write-Host "3. Press Ctrl+Alt+O to open in browser" -ForegroundColor White
}
else {
    Write-Host "  CONFIGURATION HAS ERRORS!" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Please fix the errors above by editing config.ps1" -ForegroundColor Yellow
}

Write-Host ""
pause
