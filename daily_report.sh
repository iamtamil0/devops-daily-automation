#!/bin/bash

# ================================
# Daily Automation System Report
# ================================

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
OUTPUT_FILE="reports/system_report_$DATE.txt"

echo "Generating system report..."
echo "----------------------------------" > $OUTPUT_FILE
echo "📅 Report Generated On: $(date)" >> $OUTPUT_FILE
echo "----------------------------------" >> $OUTPUT_FILE

# CPU Info
echo "" >> $OUTPUT_FILE
echo "🖥️ CPU Usage:" >> $OUTPUT_FILE
top -bn1 | grep "Cpu(s)" >> $OUTPUT_FILE

# Memory
echo "" >> $OUTPUT_FILE
echo "🧠 Memory Usage:" >> $OUTPUT_FILE
free -h >> $OUTPUT_FILE

# Disk
echo "" >> $OUTPUT_FILE
echo "💽 Disk Usage:" >> $OUTPUT_FILE
df -h >> $OUTPUT_FILE

# Network
echo "" >> $OUTPUT_FILE
echo "🌐 Network Info:" >> $OUTPUT_FILE
ip addr show >> $OUTPUT_FILE

# Finished
echo "" >> $OUTPUT_FILE
echo "Report Saved Successfully: $OUTPUT_FILE"
echo "Done!"