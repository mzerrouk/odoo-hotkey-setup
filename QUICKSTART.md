# 🚀 Quick Start Guide

## For Your Current Computer

1. **Test the setup:**
   ```powershell
   cd C:\Users\Hacene\Odoo\server\odoo-setup
   .\test_config.ps1
   ```

2. **Run AutoHotkey script:**
   - Double-click `odoo_hotkeys.ahk`
   - You should see a notification that "Odoo Manager Active!"

3. **Test the hotkeys:**
   - Press `Ctrl + Alt + S` to start Odoo
   - Press `Ctrl + Alt + O` to open in browser
   - Press `Ctrl + Alt + K` to stop Odoo

## For a New Computer

### Quick Setup (5 minutes)

1. **Copy the entire `odoo-setup` folder** to your new computer

2. **Install prerequisites:**
   - Python (note the installation path)
   - AutoHotkey v2
   - Odoo (clone your repository)

3. **Edit `config.ps1` (ONLY file you need to edit!):**
   - Open in Notepad or VS Code
   - Update the paths to match your system:
     ```powershell
     $PYTHON_PATH = "C:\Users\YourName\odoo18\python\python.exe"
     $ODOO_SERVER_PATH = "C:\Users\YourName\odoo18\server"
     $MODULE_TO_UPDATE = "your_module_name"
     ```
   - Save the file
   
   > **Note**: The AutoHotkey script automatically reads from `config.ps1`. No need to edit it!

4. **Test configuration:**
   ```powershell
   .\test_config.ps1
   ```

5. **Run AutoHotkey:**
   - Double-click `odoo_hotkeys.ahk`
   - (Optional) Add to Windows Startup

6. **Done!** Press `Ctrl + Alt + S` to start Odoo

## Hotkeys Reference

| Hotkey | Action |
|--------|--------|
| `Ctrl + Alt + S` | **S**tart Odoo |
| `Ctrl + Alt + K` | **K**ill/Stop Odoo |
| `Ctrl + Alt + R` | **R**estart Odoo (with module update) |
| `Ctrl + Alt + L` | View **L**ogs |
| `Ctrl + Alt + O` | **O**pen in browser |

## Troubleshooting

**"Execution policy" error?**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**AutoHotkey not working?**
- Make sure you installed AutoHotkey **v2** (not v1)
- Right-click `odoo_hotkeys.ahk` → Run as Administrator

**Odoo won't start?**
- Run `test_config.ps1` to check paths
- Check `odoo.log` for errors
- Make sure PostgreSQL is running

## Files Overview

- **config.ps1** - **SINGLE SOURCE OF TRUTH** - Edit this first! Contains all paths
- **get_config.ps1** - Helper script (auto-used by AutoHotkey, don't edit)
- **test_config.ps1** - Run this to verify setup
- **odoo_hotkeys.ahk** - Run this to enable hotkeys (reads from config.ps1)
- **start_odoo.ps1** - Start Odoo manually
- **stop_odoo.ps1** - Stop Odoo manually
- **restart_odoo.ps1** - Restart with module update
- **restart_odoo_quick.ps1** - Quick restart (no update)
- **README.md** - Full documentation
