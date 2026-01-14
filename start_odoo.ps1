# ---- Start Odoo Server ----
# Script to start Odoo server with development mode

# Load configuration
. "$PSScriptRoot\config.ps1"

# Verify configuration
Write-Host "Checking Odoo installation..." -ForegroundColor Cyan

if (-Not (Test-OdooConfiguration)) {
    Write-Host "`nPlease update config.ps1 with correct paths!" -ForegroundColor Yellow
    pause
    exit 1
}

Write-Host "[OK] All paths verified" -ForegroundColor Green
Write-Host "Starting Odoo server in development mode..." -ForegroundColor Yellow
Write-Host ""

# Run Odoo with proper output display
$env:PYTHONUNBUFFERED = "1"
& $PYTHON_PATH $ODOO_BIN -c $ODOO_CONF $DEV_MODE
