#!/usr/bin/env bash
set -e

# Check if CI workflow file exists
if [[ -f ".github/workflows/ci.yml" ]]; then
  echo "PASS: CI workflow file exists"
  exit 0
else
  echo "FAIL: CI workflow file does not exist"
  exit 1
fi
