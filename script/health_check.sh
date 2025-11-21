#!/bin/bash

echo "Running health check..."
ping -c 1 google.com > dev/null 2>&1

if [ $? -eq 0 ]; then
  echo "HEALTH CHECK PASSED: Internet is reachable."
else
  echo "HEALTH CHECK FAILED: Internet is not reachable."
  exit 1
fi

set -euo pipefail

DATE=$(date +"%Y-%m-%d %H:%M:%S")
ALERT_FILE="alerts/alert_$(date +%s).txt"

mkdir -p alerts

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_FREE=$(free -m | awk '/Mem:/ {print $4}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

ALERT=""

if (( $(echo "$CPU_USAGE > 85" | bc -l) )); then
  ALERT+="⚠ High CPU Usage: ${CPU_USAGE}%\n"
fi

if (( MEM_FREE < 500 )); then
  ALERT+="⚠ Low Free RAM: ${MEM_FREE}MB\n"
fi

if (( DISK_USAGE > 80 )); then
  ALERT+="⚠ Disk Usage High: ${DISK_USAGE}%\n"
fi

if [ -z "$ALERT" ]; then
  echo "All systems normal at $DATE"
else
  echo -e "🚨 ALERT at $DATE\n$ALERT" | tee "$ALERT_FILE"
fi

if [ -n "$ALERT" ]; then
  echo -e "🚨 ALERT at $DATE\n$ALERT" | tee "$ALERT_FILE"

  if [[ -n "${SLACK_WEBHOOK_URL:-}" ]]; then
    curl -X POST -H 'Content-type: application/json' \
      --data "{\"text\": \"🚨 *System Alert* \n$ALERT\"}" \
      "$SLACK_WEBHOOK_URL"
  fi
fi