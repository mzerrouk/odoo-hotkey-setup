; ========================================
; Odoo Server Manager - Global Hotkeys
; ========================================
; This script provides system-wide hotkeys to manage Odoo server
; Works from anywhere in Windows (browser, file explorer, etc.)

#Requires AutoHotkey v2.0
#SingleInstance Force

; ========================================
; CONFIGURATION - LOADED FROM config.ps1
; ========================================
; All configuration is centralized in config.ps1
; This script dynamically reads from it at startup

; Helper function to get config values from PowerShell
GetConfig(key) {
    scriptDir := A_ScriptDir
    cmd := 'powershell.exe -ExecutionPolicy Bypass -File "' . scriptDir . '\get_config.ps1" -Key "' . key . '"'
    result := RunWaitOne(cmd)
    return Trim(result)
}

; Helper function to run PowerShell and capture output
RunWaitOne(command) {
    shell := ComObject("WScript.Shell")
    exec := shell.Exec(command)
    return exec.StdOut.ReadAll()
}

; Load configuration from config.ps1
SCRIPT_DIR := GetConfig("SCRIPT_DIR")
ODOO_SERVER_PATH := GetConfig("ODOO_SERVER_PATH")
LOG_FILE := GetConfig("ODOO_LOG")

; Script paths (these use the path above)
RESTART_SCRIPT := SCRIPT_DIR . "\restart_odoo.ps1"
START_SCRIPT := SCRIPT_DIR . "\start_odoo.ps1"
STOP_SCRIPT := SCRIPT_DIR . "\stop_odoo.ps1"

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
