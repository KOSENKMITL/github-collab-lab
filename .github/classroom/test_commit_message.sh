#!/usr/bin/env bash
set -euo pipefail

# Read last commit message (raw, don't modify case)
MSG=$(git log -1 --pretty=%B || true)

if [[ -z "${MSG:-}" ]]; then
  echo "FAIL: Could not read last commit message"
  exit 1
fi

# Use grep -qi (quiet + case-insensitive)
if echo "$MSG" | grep -qi "add" && echo "$MSG" | grep -qi "name"; then
  echo "PASS: Commit message contains 'add' and 'name'"
  exit 0
else
  echo "FAIL: Commit message must contain both 'add' and 'name'. Got: $MSG"
  exit 1
fi
