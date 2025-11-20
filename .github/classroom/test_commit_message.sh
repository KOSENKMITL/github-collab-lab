#!/usr/bin/env bash
set -e

# ดึง commit message ล่าสุด
MSG=$(git log -1 --pretty=%B | tr 'A-Z' 'a-z')

if [[ -z "$MSG" ]]; then
  echo "FAIL: Could not read last commit message"
  exit 1
fi

if echo "$MSG" | grep -q "add" && echo "$MSG" | grep -q "name"; then
  echo "PASS: Commit message contains 'add' and 'name'"
  exit 0
else
  echo "FAIL: Commit message must contain both 'add' and 'name'. Got: $MSG"
  exit 1
fi
