#!/bin/bash

echo "🔍 Running basic validation tests..."

# Test 1 — Script exists
if [ ! -f "./script/daily_report.sh" ]; then
    echo "❌ Test failed: daily_report.sh not found"
    exit 1
fi
echo "✔ Test passed: Script found"

# Test 2 — Script executable
if [ ! -x "./script/daily_report.sh" ]; then
    echo "❌ Test failed: Script is not executable"
    exit 1
fi
echo "✔ Test passed: Script is executable"

# Test 3 — Run script & check output folder created
bash ./script/daily_report.sh

if [ ! -d "./logs" ]; then
    echo "❌ Test failed: logs folder not created"
    exit 1
fi
echo "✔ Test passed: logs folder created"

if [ ! -d "./reports" ]; then
    echo "❌ Test failed: reports folder not created"
    exit 1
fi
echo "✔ Test passed: reports folder created"

echo "🎉 All tests passed successfully!"