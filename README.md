## 💡 Why This Project Exists

As a web developer, I was used to fast-paced development workflows. When I switched to Odoo, I felt significantly less productive. Every single update required me to manually:
1. Stop the server
2. Update apps
3. Upgrade modules
4. Restart the server

This repetitive process was a **pain** and killed my development flow. So I built this tool to speed up Odoo development and restore my productivity.

**Good news:** Odoo already has auto-refresh built-in! With `--dev=all` mode (which this tool uses), Odoo automatically reloads when you change Python files. Combined with these hotkeys, you get a lightning-fast development experience.

**Enjoy the speed! ⚡**

---

# Odoo Server Hotkey Setup

Global hotkey system for managing Odoo server with keyboard shortcuts from anywhere in Windows.

> **✅ Tested on:** Odoo 18 Enterprise | Windows 11  
> **⚠️ Note:** Other Odoo versions and Windows versions have not been tested yet.

## 📦 What's Included

- **`.env`** - **SINGLE SOURCE OF TRUTH** - Central configuration file (paths to Python, Odoo, etc.)
- **`load_env.ps1`** - Helper script to load environment variables from `.env`
- **`odoo_hotkeys.ahk`** - AutoHotkey script for global hotkeys (reads from `.env`)
- **PowerShell Scripts:**
  - `start_odoo.ps1` - Start Odoo server
  - `stop_odoo.ps1` - Stop Odoo server
  - `restart_odoo.ps1` - Restart with module update
  - `restart_odoo_quick.ps1` - Quick restart without update

## 🚀 Quick Setup on New Computer

### Step 1: Install Prerequisites

1. **Install Python** (if not already installed)
   - Download from [python.org](https://www.python.org/downloads/)
   - Note the installation path (e.g., `C:\Users\YourName\odoo18\python\python.exe`)

2. **Install AutoHotkey v2**
   - Download from [autohotkey.com](https://www.autohotkey.com/)
   - **Required:** Version 2.0 or later (v1 will NOT work)

3. **Install Odoo**
   - Clone or copy your Odoo server files
   - Note the server path (e.g., `C:\Users\YourName\odoo18\server`)

### Step 2: Configure Paths (ONLY File to Edit!)

1. Copy `.env.example` to `.env`:
   ```powershell
   Copy-Item .env.example .env
   ```

2. Open `.env` in a text editor

3. Update the paths to match your computer:
   ```ini
   PYTHON_PATH=C:\Users\YourName\odoo18\python\python.exe
   ODOO_SERVER_PATH=C:\Users\YourName\odoo18\server
   ODOO_BIN=C:\Users\YourName\odoo18\server\odoo-bin
   ODOO_CONF=C:\Users\YourName\odoo18\server\odoo.conf
   ODOO_LOG=C:\Users\YourName\odoo18\server\odoo.log
   MODULE_TO_UPDATE=your_module_name
   DEV_MODE=--dev=all
   ```

4. Save the file

> **Important**: You only need to edit `.env`. All scripts automatically read from it!

### Step 3: Setup AutoHotkey

1. Right-click on `odoo_hotkeys.ahk`
2. Select "Run Script"
3. (Optional) Add to Windows Startup:
   - Press `Win + R`
   - Type `shell:startup` and press Enter
   - Create a shortcut to `odoo_hotkeys.ahk` in this folder

### Step 4: Test

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

## 🔧 Configuration Management

### Single Source of Truth: `.env` File

All configuration is centralized in the `.env` file. This makes it easy to:
- ✅ Update paths in one place
- ✅ Share setup with others (via `.env.example`)
- ✅ Keep local configuration private (`.env` is gitignored)
- ✅ Move to new computers easily

### Changing Configuration

Simply edit the `.env` file and all scripts will automatically use the new values on next run:

```ini
# Example: Change Python path
PYTHON_PATH=C:\NewPath\python.exe

# Example: Change module to update
MODULE_TO_UPDATE=my_custom_module
```

No need to edit any script files!

## 🐛 Troubleshooting

### PowerShell Execution Policy Error

If you get an execution policy error, run PowerShell as Administrator and execute:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### AutoHotkey Not Working

1. Make sure AutoHotkey v2 is installed (not v1)
2. Check that paths in `.env` are correct
3. Restart the AutoHotkey script after changing `.env`
4. Run the script as Administrator if needed

### Odoo Won't Start

1. Check that all paths in `.env` are correct
2. Verify Python and Odoo are properly installed
3. Check the log file (press `Ctrl + Alt + L`)
4. Run `.\start_odoo.ps1` manually to see error messages

### .env File Not Found Error

If you get ".env file not found" error:
1. Make sure `.env` exists in the `odoo-hotkey-setup` folder
2. Copy `.env.example` to `.env` if it doesn't exist
3. Update the paths in `.env` to match your system

## 📂 File Structure

```
odoo-hotkey-setup/
├── README.md                    # This file
├── QUICKSTART.md                # Quick reference guide
├── .env                         # Configuration (EDIT THIS FIRST!) - gitignored
├── .env.example                 # Configuration template
├── load_env.ps1                 # Helper script (loads .env)
├── odoo_hotkeys.ahk            # AutoHotkey script (reads .env)
├── start_odoo.ps1              # Start script
├── stop_odoo.ps1               # Stop script
├── restart_odoo.ps1            # Restart with update
└── restart_odoo_quick.ps1      # Quick restart
```

## 🎯 Tips

- **First time setup**: Copy `.env.example` to `.env` and edit it first!
- **Auto-refresh is already enabled!**: With `DEV_MODE=--dev=all` in your `.env`, Odoo automatically reloads when you change Python files. No need to restart for code changes!
- **Module updates**: Use `Ctrl + Alt + R` when you add new files, change XML/data files, or update module dependencies
- **Logs**: Press `Ctrl + Alt + L` to quickly check logs
- **Startup**: Add AutoHotkey script to Windows Startup for convenience
- **Git**: `.env` is gitignored, so your local paths stay private

## 🧪 Testing Information

**Tested Configuration:**
- **Odoo Version:** 18 Enterprise
- **Operating System:** Windows 11
- **AutoHotkey Version:** v2.0+
- **PowerShell Version:** 5.1+

**Not Yet Tested:**
- Other Odoo versions (Community, older versions)
- Other Windows versions (Windows 10, Server editions)
- Other operating systems (Linux, macOS)

If you test this setup on other configurations, please share your results!

## 📞 Support

If you encounter issues:
1. Check that all paths in `.env` are correct
2. Verify prerequisites are installed (Python, AutoHotkey v2, Odoo)
3. Check the log file for errors (`Ctrl + Alt + L`)
4. Make sure you're running PowerShell scripts from the correct directory
5. Verify you're using AutoHotkey v2 (not v1)

