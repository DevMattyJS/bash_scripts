#!/bin/bash

# Defines some colors for clearer output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No color (color reset)

echo -e "${YELLOW}=== SYSTEM CHECK (${HOSTNAME}) ===${NC}"
date
echo "------------------------------------------"

# 1. Load Average Control
# We will select the last value (average in last 15 min) using  awk
LOAD=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d',' -f3)
echo -e "System Load  (15 min): ${GREEN}$LOAD${NC}"

# 2. Control of free memory (RAM) in  MB
FREE_RAM=$(free -m | awk '/Mem:/ { print $4 }')
TOTAL_RAM=$(free -m | awk '/Mem:/ { print $2 }')
echo -e "Free RAM: ${GREEN}${FREE_RAM}MB${NC} from  ${TOTAL_RAM}MB in total"

# 3. Disk space check (/)
# NR==2 selectes the 2nd line of the df output
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$DISK_USAGE" -gt 80 ]; then
    echo -e "Disk Usage(/): ${RED}Warning! Usage is at ${DISK_USAGE}%${NC}"
else
    echo -e "Disk Usage (/): ${GREEN}OK (${DISK_USAGE}%)${NC}"
fi

# 4. Amount of running processes
PROC_COUNT=$(ps ax | wc -l)
echo -e "Amount of processes running: ${GREEN}$PROC_COUNT${NC}"

echo "------------------------------------------"
echo -e "${YELLOW}Check Finished.${NC}"
