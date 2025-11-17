#!/bin/bash

REPO="${GITHUB_REPOSITORY}"
TOKEN="${GITHUB_TOKEN}"

TITLE="⚠ System Error Detected"
BODY="An error was found in the daily report generated on $(date). Please check the logs."

curl -X post \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $TOKEN" \
    https://api.github.com/repos/${REPO}/issues \
    -d "{\"title\": \"${TITLE}\", \"body\": \"${BODY}\"}"