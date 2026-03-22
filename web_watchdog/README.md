# Self-Healing Linux Web Infrastructure

### Overview

A robust automation project designed to maintain 100% service availability on a CentOS-based web server by mitigating common SELinux "Permission Denied" (403) errors and process crashes.

### Technical Architecture

- **Language:** Bash Script
- **Service Manager:** Systemd (Custom Unit Files)
- **Logging:** Integrated with ` rsyslog ` and `systemd-journald` for professional audit trails

### Key Logic Implemented

1. **Privilege Validation:** Script utilizes `$EUID` check to ensure administrative execution.
2. **Automated Remediation:** Logic detects 403 Forbidden states and triggers `restorecon` recursively to repair security contexts without manual intervention.
3. **Fault Tolerance:** Configure with `Restart=Always` in Systemd to ensure the watchdog itself never stays down.
4. **Resource Efficiency:** Implements a localized polling interval to minimize CPU overhead.