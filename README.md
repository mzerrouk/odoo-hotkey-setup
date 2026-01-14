# Odoo Server Setup Package

This package contains all the scripts and configurations needed to manage your Odoo server with global hotkeys.

## 📦 What's Included

- **config.ps1** - Central configuration file (paths to Python, Odoo, etc.)
- **odoo_hotkeys.ahk** - AutoHotkey script for global hotkeys
- **PowerShell Scripts:**
  - `start_odoo.ps1` - Start Odoo server
  - `stop_odoo.ps1` - Stop Odoo server
  - `restart_odoo.ps1` - Restart with module update
  - `restart_odoo_quick.ps1` - Quick restart without update

## 🚀 Quick Setup on New Computer

### Step 1: Install Prerequisites

1. **Install Python** (if not already installed)
   - Download from [python.org](https://www.python.org/downloads/)
   - Note the installation path (e.g., `C:\Users\YourName\Odoo\python\python.exe`)

2. **Install AutoHotkey v2**
   - Download from [autohotkey.com](https://www.autohotkey.com/)
   - Install version 2.0 or later

3. **Install Odoo**
   - Clone or copy your Odoo server files
   - Note the server path (e.g., `C:\Users\YourName\Odoo\server`)

### Step 2: Configure Paths

1. Open `config.ps1` in a text editor
2. Update the following paths to match your new computer:
   ```powershell
   $PYTHON_PATH = "C:\Users\YourName\Odoo\python\python.exe"
   $ODOO_SERVER_PATH = "C:\Users\YourName\Odoo\server"
   ```
3. Update the module name if needed:
   ```powershell
   $MODULE_TO_UPDATE = "purchase_api"
   ```
4. Save the file

### Step 3: Copy Files

Copy all files from the `odoo-setup` folder to your Odoo server directory:
```
C:\Users\YourName\Odoo\server\
```

### Step 4: Setup AutoHotkey

1. Right-click on `odoo_hotkeys.ahk`
2. Select "Run Script"
3. (Optional) Add to Windows Startup:
   - Press `Win + R`
   - Type `shell:startup` and press Enter
   - Create a shortcut to `odoo_hotkeys.ahk` in this folder

### Step 5: Test

Press `Ctrl + Alt + S` to start Odoo server, or use any of the hotkeys below.

## ⌨️ Hotkeys

| Hotkey | Action |
|--------|--------|
| `Ctrl + Alt + S` | Start Odoo Server |
| `Ctrl + Alt + K` | Stop Odoo Server |
| `Ctrl + Alt + R` | Restart Odoo (with module update) |
| `Ctrl + Alt + L` | Open Odoo log file |
| `Ctrl + Alt + O` | Open Odoo in browser (http://localhost:8069) |

## 📝 Manual Usage

You can also run the scripts manually from PowerShell:

```powershell
# Start Odoo
.\start_odoo.ps1

# Stop Odoo
.\stop_odoo.ps1

# Restart with module update
.\restart_odoo.ps1

# Quick restart (no update)
.\restart_odoo_quick.ps1
```

## 🔧 Troubleshooting

### PowerShell Execution Policy Error

If you get an execution policy error, run PowerShell as Administrator and execute:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### AutoHotkey Not Working

1. Make sure AutoHotkey v2 is installed (not v1)
2. Check that paths in `odoo_hotkeys.ahk` are correct
3. Run the script as Administrator if needed

### Odoo Won't Start

1. Check that all paths in `config.ps1` are correct
2. Verify Python and Odoo are properly installed
3. Check `odoo.log` for error messages

## 📂 File Structure

```
odoo-setup/
├── README.md                    # This file
├── config.ps1                   # Configuration (EDIT THIS FIRST!)
├── odoo_hotkeys.ahk            # AutoHotkey script
├── start_odoo.ps1              # Start script
├── stop_odoo.ps1               # Stop script
├── restart_odoo.ps1            # Restart with update
└── restart_odoo_quick.ps1      # Quick restart
```

## 🎯 Tips

- **First time setup**: Always edit `config.ps1` first!
- **Module updates**: Use `Ctrl + Alt + R` when you change code
- **Quick restarts**: Modify `restart_odoo_quick.ps1` to use it with the hotkey
- **Logs**: Press `Ctrl + Alt + L` to quickly check logs
- **Startup**: Add AutoHotkey script to Windows Startup for convenience

## 📞 Support

If you encounter issues:
1. Check that all paths in `config.ps1` are correct
2. Verify prerequisites are installed
3. Check the log file for errors
4. Make sure you're running PowerShell scripts from the Odoo server directory
