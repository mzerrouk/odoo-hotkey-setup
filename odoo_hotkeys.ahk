; ========================================
; Odoo Server Manager - Global Hotkeys
; ========================================
; This script provides system-wide hotkeys to manage Odoo server
; Works from anywhere in Windows (browser, file explorer, etc.)

#Requires AutoHotkey v2.0
#SingleInstance Force

; ========================================
; CONFIGURATION - EDIT THIS SECTION!
; ========================================
; Update this path to match your Odoo server location
ODOO_SERVER_PATH := "C:\Users\Hacene\Odoo\server\odoo-setup"

; Script paths (these use the path above)
RESTART_SCRIPT := ODOO_SERVER_PATH . "\restart_odoo.ps1"
START_SCRIPT := ODOO_SERVER_PATH . "\start_odoo.ps1"
STOP_SCRIPT := ODOO_SERVER_PATH . "\stop_odoo.ps1"
LOG_FILE := "C:\Users\Hacene\Odoo\server\odoo.log"

; ========================================
; HOTKEYS
; ========================================

; Ctrl+Alt+R - Restart Odoo Server
^!r::
{
    TrayTip "Restarting Odoo Server...", "Odoo Manager", 1
    RunWait('powershell.exe -ExecutionPolicy Bypass -File "' . RESTART_SCRIPT . '"', , "Hide")
    TrayTip "Odoo Server Restarted!", "Odoo Manager", 1
    return
}

; Ctrl+Alt+S - Start Odoo Server
^!s::
{
    TrayTip "Starting Odoo Server...", "Odoo Manager", 1
    Run('powershell.exe -ExecutionPolicy Bypass -File "' . START_SCRIPT . '"')
    TrayTip "Odoo Server Started!", "Odoo Manager", 1
    return
}

; Ctrl+Alt+K - Kill/Stop Odoo Server
^!k::
{
    TrayTip "Stopping Odoo Server...", "Odoo Manager", 1
    RunWait('powershell.exe -ExecutionPolicy Bypass -File "' . STOP_SCRIPT . '"', , "Hide")
    TrayTip "Odoo Server Stopped!", "Odoo Manager", 1
    return
}

; Ctrl+Alt+L - Open Odoo Log File
^!l::
{
    Run('notepad.exe "' . LOG_FILE . '"')
    return
}

; Ctrl+Alt+O - Open Odoo in Browser
^!o::
{
    Run("http://localhost:8069")
    return
}

; ========================================
; TRAY MENU
; ========================================

; Create custom tray menu
A_TrayMenu.Delete()
A_TrayMenu.Add("Odoo Server Manager", (*) => MsgBox("Odoo Server Manager`n`nHotkeys:`nCtrl+Alt+R - Restart`nCtrl+Alt+S - Start`nCtrl+Alt+K - Stop`nCtrl+Alt+L - View Logs`nCtrl+Alt+O - Open Browser", "Odoo Manager"))
A_TrayMenu.Add()
A_TrayMenu.Add("Restart Odoo (Ctrl+Alt+R)", (*) => Send("^!r"))
A_TrayMenu.Add("Start Odoo (Ctrl+Alt+S)", (*) => Send("^!s"))
A_TrayMenu.Add("Stop Odoo (Ctrl+Alt+K)", (*) => Send("^!k"))
A_TrayMenu.Add()
A_TrayMenu.Add("View Logs (Ctrl+Alt+L)", (*) => Send("^!l"))
A_TrayMenu.Add("Open Browser (Ctrl+Alt+O)", (*) => Send("^!o"))
A_TrayMenu.Add()
A_TrayMenu.Add("Exit", (*) => ExitApp())

; Set tray icon tooltip
A_IconTip := "Odoo Server Manager`nCtrl+Alt+R to restart"

; Show startup notification
TrayTip "Odoo Manager Active!", "Press Ctrl+Alt+R to restart Odoo", 2
