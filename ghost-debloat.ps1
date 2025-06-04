
# ghost-debloat.ps1
# Modular Windows 11 Debloater Script by Jay Nicholson (Ghotet)
# AI-assisted logic with system restore and safe toggles

# === Check for Admin Rights ===
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "This script must be run as Administrator."
    exit
}

# === Create System Restore Point ===
Write-Host "Creating system restore point..." -ForegroundColor Cyan
Checkpoint-Computer -Description "ghost-debloat pre-cleanup" -RestorePointType "MODIFY_SETTINGS"
Write-Host "Restore point created." -ForegroundColor Green

# === Disable Services ===
Write-Host "Disabling unnecessary services..." -ForegroundColor Yellow
Stop-Service "SysMain" -Force
Set-Service "SysMain" -StartupType Disabled

Stop-Service "DiagTrack" -Force
Set-Service "DiagTrack" -StartupType Disabled

Stop-Service "Spooler" -Force
Set-Service "Spooler" -StartupType Disabled

# === Registry Tweaks ===
Write-Host "Applying registry tweaks..." -ForegroundColor Yellow

# GPU Priority
Set-ItemProperty -Path "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 38

# Latency Optimization
New-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -PropertyType DWord -Force
New-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -PropertyType DWord -Force

# Disable Telemetry
Set-ItemProperty -Path "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0

# === App Removal ===
Write-Host "Removing unnecessary apps..." -ForegroundColor Yellow

# Clipchamp - Removed unless user modifies script to skip
Get-AppxPackage *Clipchamp* | Remove-AppxPackage

# Xbox (All related)
Get-AppxPackage *xbox* | Remove-AppxPackage

# Widgets and web search features
Remove-ItemProperty -Path "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -ErrorAction SilentlyContinue
Remove-ItemProperty -Path "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaConsent" -ErrorAction SilentlyContinue

# === Optional: Skip Sticky Notes removal ===
# Get-AppxPackage *MicrosoftStickyNotes* | Remove-AppxPackage

Write-Host "Debloat complete. Please reboot for all changes to take effect." -ForegroundColor Green
