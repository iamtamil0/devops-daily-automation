#!/bin/bash

ISSUE_TITLE="System Alert: Error detected on $(date '+%Y-%m-%d')"
ISSUE_BODY=$(cat reports/latest_report.txt)

echo "Creating GitHub Issue..."

curl -X post \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: Application/vnd.github+json" \
    https://api.github.come/repos/${GITHUB_REPOSITORY}/issues \
    -d "{
        \"title\": \"$ISSUE_TITLE\",
        \"body\": \"$ISSUE_BODY\",
        \"labels\": [\"system-alert\", \"automation\"]
    }"