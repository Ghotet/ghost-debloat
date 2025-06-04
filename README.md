# ghost-debloat

A modular, AI-augmented Windows 11 debloater script designed to strip bloat, disable surveillance, and optimize system performance for AI development, creative work, or raw speed.

---

## Features

- Disable known performance-draining services (SysMain, DiagTrack, etc)
- Optional removal of bloatware apps and edge-case Windows features
- Registry tweaks for:
  - GPU priority
  - Latency reduction
  - Telemetry blocking
- Modular flag system for full control (no blind nuking)
- Optional system restore point creation
- Built and tested across real-world AI/dev setups

---

## Usage

1. Open PowerShell as Admin  
2. Run:  
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; ./ghost-debloat.ps1

---

## ⚠️ System Safety Notes

This script is designed specifically for **laptop and portable PC users**.  
It will **not** disable or affect:
- Bluetooth functionality
- Wi-Fi and networking services
- Audio drivers or touchpad-related components

All aggressive options (like Sticky Notes removal) are **commented out by default**.  
Restore point is created at the start for rollback support.

If any issues occur or services are impacted unexpectedly, open an issue in the repo and it’ll be reviewed.

> *Precision, not destruction.*

---

## Notes

This script was co-developed using GPT-4 for logic optimization, flag modularity, and PowerShell syntax support. Human intelligence guided the vision—AI filled in the syntax.

Use with awareness. Some tweaks are aggressive by default.

---

## Author

**Jay Nicholson** (Dev handle: `Ghotet`)  
*AI-augmented systems optimizer | github.com/Ghotet*
