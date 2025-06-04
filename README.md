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
