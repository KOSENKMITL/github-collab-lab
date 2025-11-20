#!/usr/bin/env bash
set -e

# ใช้ชื่อ branch จาก GitHub ถ้ามี, ถ้าไม่มีก็ใช้ HEAD ปัจจุบัน
BRANCH="${GITHUB_HEAD_REF:-$(git rev-parse --abbrev-ref HEAD)}"

if [[ "$BRANCH" == feature/add-name-* ]]; then
  echo "PASS: Branch name follows feature/add-name-* convention"
  exit 0
else
  echo "FAIL: Branch name '$BRANCH' does not follow feature/add-name-* convention"
  exit 1
fi
