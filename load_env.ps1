# ========================================
# .env File Loader for PowerShell
# ========================================
# This script loads environment variables from .env file
# Usage: . "$PSScriptRoot\load_env.ps1"

$envFile = Join-Path $PSScriptRoot ".env"

if (-Not (Test-Path $envFile)) {
    Write-Host "ERROR: .env file not found at: $envFile" -ForegroundColor Red
    Write-Host "Please create a .env file based on .env.example" -ForegroundColor Yellow
    exit 1
}

# Read and parse .env file
Get-Content $envFile | ForEach-Object {
    $line = $_.Trim()
    
    # Skip empty lines and comments
    if ($line -eq "" -or $line.StartsWith("#")) {
        return
    }
    
    # Parse KEY=VALUE format
    if ($line -match "^([^=]+)=(.*)$") {
        $key = $matches[1].Trim()
        $value = $matches[2].Trim()
        
        # Remove quotes if present
        $value = $value -replace '^["'']|["'']$', ''
        
        # Set as global variable
        Set-Variable -Name $key -Value $value -Scope Global
        
        # Also set as environment variable for child processes
        [System.Environment]::SetEnvironmentVariable($key, $value, [System.EnvironmentVariableTarget]::Process)
    }
}

Write-Host "Configuration loaded from .env" -ForegroundColor Green
