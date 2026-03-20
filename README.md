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
1. **Download**
```shell
git clone https://github.com/DevMattyJS/bash_scripts.git
cd bash_scripts
```
2. **Add execute permission**
```shell
chmod +x sys_check.sh
```
3. ***Run the script**
```shell
./sys_check.sh
```
## Why I Created This?
This project was created as a part of my LFS101 (Linux Foundation) course.
The goal was to create a tool that would save an administrator time from manually entering multiple diagnostic commands and provide him with a clear report on one click.

 
