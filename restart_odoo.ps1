# ---- Restart Odoo Server with Auto-Update ----
# Standalone script to restart Odoo and update modules
# Can be called from AutoHotkey or manually

# Load configuration from .env file
. "$PSScriptRoot\load_env.ps1"


Write-Host "========================================" -ForegroundColor Magenta
Write-Host "  RESTARTING ODOO WITH AUTO-UPDATE" -ForegroundColor Magenta
Write-Host "========================================" -ForegroundColor Magenta
Write-Host ""

# Step 1: Stop Odoo
Write-Host "[1/4] Stopping Odoo processes..." -ForegroundColor Yellow
Get-Process -Name python -ErrorAction SilentlyContinue | 
Where-Object { $_.Path -like '*Odoo*' } | 
Stop-Process -Force -ErrorAction SilentlyContinue

Start-Sleep -Seconds 2
Write-Host "[OK] Odoo stopped" -ForegroundColor Green
Write-Host ""

# Step 2: Update apps list and upgrade module
Write-Host "[2/4] Updating apps list and upgrading module '$MODULE_TO_UPDATE'..." -ForegroundColor Yellow
$updateArgs = "$ODOO_BIN -c $ODOO_CONF -u $MODULE_TO_UPDATE --stop-after-init"
$updateProcess = Start-Process -FilePath $PYTHON_PATH -ArgumentList $updateArgs -NoNewWindow -PassThru -Wait

if ($updateProcess.ExitCode -eq 0) {
    Write-Host "[OK] Module updated successfully" -ForegroundColor Green
}
else {
    Write-Host "[WARNING] Module update completed with exit code: $($updateProcess.ExitCode)" -ForegroundColor Yellow
}
Write-Host ""

# Step 3: Start Odoo
Write-Host "[3/4] Starting Odoo server..." -ForegroundColor Yellow
$env:PYTHONUNBUFFERED = "1"
Start-Process -FilePath $PYTHON_PATH -ArgumentList "$ODOO_BIN -c $ODOO_CONF $DEV_MODE" -WindowStyle Hidden

Start-Sleep -Seconds 3
Write-Host "[OK] Odoo started" -ForegroundColor Green
Write-Host ""

# Step 4: Verify
Write-Host "[4/4] Verifying..." -ForegroundColor Yellow
$process = Get-Process -Name python -ErrorAction SilentlyContinue | Where-Object { $_.Path -like '*Odoo*' }
if ($process) {
    Write-Host "[OK] Odoo is running (PID: $($process.Id))" -ForegroundColor Green
    Write-Host "[INFO] Module '$MODULE_TO_UPDATE' has been updated" -ForegroundColor Cyan
    Write-Host "[INFO] Access at: http://localhost:8069" -ForegroundColor Cyan
}
else {
    Write-Host "[ERROR] Odoo failed to start" -ForegroundColor Red
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Magenta
Write-Host "  RESTART COMPLETE" -ForegroundColor Magenta
Write-Host "========================================" -ForegroundColor Magenta
