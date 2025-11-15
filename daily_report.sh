#!/bin/bash

# Creating Foldersif missing
mkdir -p reports
mkdir -p logs

LOG_FILE="log/run_$(date +%Y-%m-%d_*%H-%M-%S).log"
REPORT_FILE="reports/system_report_$(date +%Y-%m-%d_%H-%m-%s).txt"

echo "Generating system report..." | tee -a "$LOG_FILE"

{
    echo"===== System Report ===="
    echo "Date: $(date)"
    echo "Hostname: $(hostname)"

    echo "===== Disk Usage ====="
    df -h
    echo

    echo "===== CPU Load ====="
    uptime
    echo

    echo "===== Last Logged-in Users ====="
    last | head
    echo
} > "$REPORT_FILE"

echo "Report Saved Successfully: $REPORT_FILE" | tee -a "$LOG_FILE"

# Auto=cleanup: delete reports older than 7 days
find reports/ -type f -mtime +7 -delete
find logs/ -type f -mtime +7 -delete

echo "old reports & logs cleaned (older then 7 days)" | tee -a "$LOG_FILE"

echo "Done!"