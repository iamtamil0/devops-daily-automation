#!/bin/bash

set -euo pipefail
trap 'echo "❌ Error occurred in script at line $LINENO"' ERR

# ================================
# Daily Automation System Report
# ================================

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
LOGFILE="logs/report_$DATE.log"

# Create logs folder if missing
mkdir -p logs
mkdir -p reports

# Correct usage of LOGFILE instead of LOG_FILE
echo "Script complete successfully at $(date)" | tee -a "$LOGFILE"