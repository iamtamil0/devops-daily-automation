#!/bin/bash

#======================================================
#  DAILY SYSTEM REPORT SCRIPT (GitHub Actions Safe)
#======================================================

# Create reports directory (if not exists)
mkdir -p reports

# Generate filename with timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="reports/system_report_$TIMESTAMP.txt"

# Start the report
echo "======================================" > "$REPORT_FILE"
echo " DAILY SYSTEM REPORT" >> "$REPORT_FILE"
echo " Generated on: $(date)" >> "$REPORT_FILE"
echo "======================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"


# ---------------------
# CPU INFORMATION
# ---------------------
echo "---- CPU INFORMATION ----" >> "$REPORT_FILE"
lscpu >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"


# ---------------------
# MEMORY INFORMATION
# ---------------------
echo "---- MEMORY INFORMATION ----" >> "$REPORT_FILE"
free -h >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"


# ---------------------
# DISK USAGE
# ---------------------
echo "---- DISK USAGE ----" >> "$REPORT_FILE"
df -h >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"


# ---------------------
# TOP PROCESSES
# ---------------------
echo "---- TOP 10 PROCESSES ----" >> "$REPORT_FILE"
ps aux --sort=-%cpu | head -n 10 >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"


# ---------------------
# SYSTEM UPTIME
# ---------------------
echo "---- SYSTEM UPTIME ----" >> "$REPORT_FILE"
uptime >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"


# ---------------------
# FINAL OUTPUT
# ---------------------
echo "Report saved to $REPORT_FILE"
echo "Copying latest report to reports/latest_report.txt"

cp "$REPORT_FILE" reports/latest_report.txt