#!/bin/bash
# Update the "last updated" timestamp in index.html and push to GitHub
set -e
cd "$(dirname "$0")"
TIMESTAMP=$(date -u "+%Y-%m-%d %H:%M UTC")
# Replace the content inside the <p id="last-updated" ...> tag
sed -i "s|<p id=\"last-updated\" class=\"text-muted\">.*</p>|<p id=\"last-updated\" class=\"text-muted\">Last updated: $TIMESTAMP</p>|" index.html
# Commit and push if there are changes
if git diff --quiet; then
  echo "No changes to commit."
else
  git add index.html
  git commit -m "Update last-updated timestamp to $TIMESTAMP"
  git push
fi
