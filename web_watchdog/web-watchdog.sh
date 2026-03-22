#!/bin/bash
# ====================================================
# NAME: web-watchdog.sh
# DESCRIPTION: Self-healing monitor for Apache SELinux compliance.
# Author: Matej Sliacky
# ====================================================

TARGET_URL="http://localhost/index.html"
WEB_ROOT="/var/www/my-secure-site"
SLEEP_INTERVAL=10

# Ensure script is running as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

logger "WATCHDOG_SERVICE: Initializing monitor for $TARGET_URL"

while true; do
    # Probe the web server for its HTTP status code
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$TARGET_URL")

    case $HTTP_STATUS in
        200)
            # System is healthy; no action needed
            ;;
        403)
            logger -p user.warn "WATCHDOG_EVENT: 403 Forbidden detected. Triggering SELinux repair."
            /usr/sbin/restorecon -R "$WEB_ROOT"
            ;;
        000)
            logger -p user.err "WATCHDOG_EVENT: Web server unreachable (Down)."
            ;;
        *)
            logger -p user.notice "WATCHDOG_EVENT: Received unexpected status $HTTP_STATUS"
            ;;
    esac

    sleep "$SLEEP_INTERVAL"
done
