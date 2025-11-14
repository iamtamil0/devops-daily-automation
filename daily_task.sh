#!/bin/bash

# Daily automation script
DATE=$(date +"%Y-%m-%d %H:%M:%S")

echo "Running daily automation at $DATE" | tee -a ./logs/daily.log
