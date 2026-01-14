# ---- Quick Restart Odoo (No Update) ----
# Fast restart without updating modules
# Use this when you just need to restart without module updates

# Load configuration
. "$PSScriptRoot\config.ps1"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  QUICK RESTART (NO UPDATE)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Stop Odoo
Write-Host "[1/3] Stopping Odoo..." -ForegroundColor Yellow
Get-Process -Name python -ErrorAction SilentlyContinue | 
Where-Object { $_.Path -like '*Odoo*' } | 
Stop-Process -Force -ErrorAction SilentlyContinue

Start-Sleep -Seconds 1
Write-Host "[OK] Stopped" -ForegroundColor Green
Write-Host ""

# Start Odoo
Write-Host "[2/3] Starting Odoo..." -ForegroundColor Yellow
$env:PYTHONUNBUFFERED = "1"
Start-Process -FilePath $PYTHON_PATH -ArgumentList "$ODOO_BIN -c $ODOO_CONF $DEV_MODE" -WindowStyle Hidden

Start-Sleep -Seconds 2
Write-Host "[OK] Started" -ForegroundColor Green
Write-Host ""

# Verify
Write-Host "[3/3] Verifying..." -ForegroundColor Yellow
$process = Get-Process -Name python -ErrorAction SilentlyContinue | Where-Object { $_.Path -like '*Odoo*' }
if ($process) {
    Write-Host "[OK] Odoo is running (PID: $($process.Id))" -ForegroundColor Green
}
else {
    Write-Host "[ERROR] Failed to start" -ForegroundColor Red
}

Write-Host ""
Write-Host "Quick restart complete!" -ForegroundColor Cyan
