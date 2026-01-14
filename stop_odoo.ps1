# ---- Stop Odoo Server ----
# Standalone script to stop Odoo

Write-Host "Stopping Odoo server..." -ForegroundColor Yellow

Get-Process -Name python -ErrorAction SilentlyContinue | 
Where-Object { $_.Path -like '*Odoo*' } | 
Stop-Process -Force -ErrorAction SilentlyContinue

Write-Host "[OK] Odoo server stopped" -ForegroundColor Green
