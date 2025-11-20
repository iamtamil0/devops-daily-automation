#!/bin/bash

set -euo pipefail
trap 'echo "❌ Error at line $LINENO"' ERR

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
LOGFILE="logs/report_$DATE.txt"

mkdir -p logs
mkdir -p reports

echo "-----------------------" | tee -a "$LOGFILE"
echo "Hostname: $(hostname)" | tee -a "$LOGFILE"
echo "Uptime: $(uptime -p)" | tee -a "$LOGFILE"
echo "Current User: $(whoami)" | tee -a "$LOGFILE"

echo | tee -a "$LOGFILE"
echo "📂 DISK USAGE" | tee -a "$LOGFILE"
echo "-----------------------" | tee -a "$LOGFILE"
df -h | tee -a "$LOGFILE"

echo | tee -a "$LOGFILE"
echo "🧠 MEMORY USAGE" | tee -a "$LOGFILE"
echo "-----------------------" | tee -a "$LOGFILE"
free -h | tee -a "$LOGFILE"

echo | tee -a "$LOGFILE"
echo "🌐 NETWORK INFO" | tee -a "$LOGFILE"
echo "-----------------------" | tee -a "$LOGFILE"
ip addr | tee -a "$LOGFILE"

cp "$LOGFILE" "reports/report_$DATE.txt"

echo "✔ Report generated successfully"