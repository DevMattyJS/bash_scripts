# System Health Check Script

Simple bash script designed to quickly diagnose the current state of a Linux server.
The script provides an instant overview of key system metrics with visual signaling of critical states.

## Feature Overview 
The script monitors the following parameters:
- **CPU Load:** Average load over the last 15 minutes.
- **Memory Usage (RAM):** List of free and total memory in MB.
- **Disk Space Status:** Checks the root directory with automatic warning (red color) if the fill exceeds 80%.
- **Active Processes:** Total number of the processes running on the system.

## Installation and Launch
1. Download
```bash
git clone https://github.com/DevMattyJS/bash_scripts.git
cd bash_scripts
```

 
