# ========================================
# Configuration Value Getter
# ========================================
# Helper script to export config values for AutoHotkey
# Usage: .\get_config.ps1 -Key "VARIABLE_NAME"

param(
    [Parameter(Mandatory = $true)]
    [string]$Key
)

# Load the main configuration
. "$PSScriptRoot\config.ps1"

# Return the requested value
switch ($Key) {
    "ODOO_SERVER_PATH" { Write-Output $ODOO_SERVER_PATH }
    "PYTHON_PATH" { Write-Output $PYTHON_PATH }
    "ODOO_BIN" { Write-Output $ODOO_BIN }
    "ODOO_CONF" { Write-Output $ODOO_CONF }
    "ODOO_LOG" { Write-Output $ODOO_LOG }
    "MODULE_TO_UPDATE" { Write-Output $MODULE_TO_UPDATE }
    "SCRIPT_DIR" { Write-Output $PSScriptRoot }
    default { 
        Write-Error "Unknown configuration key: $Key"
        exit 1
    }
}
