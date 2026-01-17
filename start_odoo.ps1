# ---- Start Odoo Server ----
# Script to start Odoo server with development mode

# Load configuration from .env file
. "$PSScriptRoot\load_env.ps1"

# Verify configuration
Write-Host "Checking Odoo installation..." -ForegroundColor Cyan

if (-Not (Test-Path $PYTHON_PATH)) {
    Write-Host "Python not found at: $PYTHON_PATH" -ForegroundColor Red
    pause
    exit 1
}

if (-Not (Test-Path $ODOO_BIN)) {
    Write-Host "Odoo binary not found at: $ODOO_BIN" -ForegroundColor Red
    pause
    exit 1
}

if (-Not (Test-Path $ODOO_CONF)) {
    Write-Host "Odoo config not found at: $ODOO_CONF" -ForegroundColor Red
    pause
    exit 1
}

Write-Host "[OK] All paths verified" -ForegroundColor Green
Write-Host "Starting Odoo server in development mode..." -ForegroundColor Yellow
Write-Host ""

# Run Odoo with proper output display
$env:PYTHONUNBUFFERED = "1"
& $PYTHON_PATH $ODOO_BIN -c $ODOO_CONF $DEV_MODE
