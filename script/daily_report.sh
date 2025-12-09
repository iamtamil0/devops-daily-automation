#!/bin/bash

REPORT="reports/system_report_$(date +"%Y-%m-%d_%H-%M-%S").txt"

mkdir -p reports

{
    echo "======================="
    echo "   Daily System Report   "
    echo "   Date: $(date)   "
    echo "======================="
    
    echo -e "\n🖥️ SYSTEM INFO"
    uname -a

    echo -e "\n📦 DISK USAGE"
    df -h

    echo -e "\n🔥 TOP MEMORY & CPU USAGE"
    top -b -n 1 | head -n 20

    echo -e "\n🐳 DOCKER STATUS (if installed)"
    docker ps -a || echo "Docker not installed."

    echo -e "\n📁 GIT STATUS"
    git status || echo "Not a git repository."

    echo -e "\n✔ Report generation completed."
    } > "$REPORT"

echo "  Report saved to $REPORT"

set -euo pipefail
trap 'echo "❌ Error at line $LINENO"' ERR

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
LOGFILE="logs/report_$DATE.txt"

mkdir -p logs
mkdir -p .reports
echo "Daily System Report - $(date)" > .reports/latest_report.txt
neofetch >> .reports/latest_report.txt

echo "Daily System Report - $(date)" > "$REPORT"

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