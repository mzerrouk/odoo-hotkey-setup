# ========================================
# Odoo Server Configuration
# ========================================
# Edit these paths to match your computer setup
# This file is used by all PowerShell scripts

# ---- PATHS (EDIT THESE!) ----
$PYTHON_PATH = "C:\Users\Hacene\Odoo\python\python.exe"
$ODOO_SERVER_PATH = "C:\Users\Hacene\Odoo\server"
$ODOO_BIN = "$ODOO_SERVER_PATH\odoo-bin"
$ODOO_CONF = "$ODOO_SERVER_PATH\odoo.conf"
$ODOO_LOG = "$ODOO_SERVER_PATH\odoo.log"

# ---- MODULE CONFIGURATION ----
# Change this to the module you want to auto-update on restart
$MODULE_TO_UPDATE = "purchase_api"

# ---- ODOO SETTINGS ----
# Development mode flags (--dev=all enables auto-reload, better errors, etc.)
$DEV_MODE = "--dev=all"

# ---- EXPORT CONFIGURATION ----
# Make these variables available to other scripts
$global:PYTHON_PATH = $PYTHON_PATH
$global:ODOO_SERVER_PATH = $ODOO_SERVER_PATH
$global:ODOO_BIN = $ODOO_BIN
$global:ODOO_CONF = $ODOO_CONF
$global:ODOO_LOG = $ODOO_LOG
$global:MODULE_TO_UPDATE = $MODULE_TO_UPDATE
$global:DEV_MODE = $DEV_MODE

# ---- VALIDATION ----
function Test-OdooConfiguration {
    $errors = @()
    
    if (-Not (Test-Path $PYTHON_PATH)) {
        $errors += "Python not found at: $PYTHON_PATH"
    }
    
    if (-Not (Test-Path $ODOO_BIN)) {
        $errors += "Odoo binary not found at: $ODOO_BIN"
    }
    
    if (-Not (Test-Path $ODOO_CONF)) {
        $errors += "Odoo config not found at: $ODOO_CONF"
    }
    
    if ($errors.Count -gt 0) {
        Write-Host "Configuration Errors:" -ForegroundColor Red
        foreach ($error in $errors) {
            Write-Host "  - $error" -ForegroundColor Red
        }
        return $false
    }
    
    return $true
}

# Display configuration when loaded
Write-Host "Odoo Configuration Loaded:" -ForegroundColor Cyan
Write-Host "  Python: $PYTHON_PATH" -ForegroundColor Gray
Write-Host "  Server: $ODOO_SERVER_PATH" -ForegroundColor Gray
Write-Host "  Module: $MODULE_TO_UPDATE" -ForegroundColor Gray
