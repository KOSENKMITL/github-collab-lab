#!/usr/bin/env bash
set -e

FILE="practice/students.md"

if [ ! -f "$FILE" ]; then
  echo "FAIL: File practice/students.md not found."
  exit 1
fi

# นับจำนวนบรรทัดที่เป็นรูปแบบ:
# - ชื่อ (รหัสนักศึกษา)
# และไม่ใช่ Example Student
STUDENT_COUNT=$(grep -E "^- .+\([0-9]+" "$FILE" | grep -v "Example Student" | wc -l | tr -d ' ')

if [ "$STUDENT_COUNT" -ge 1 ]; then
  echo "PASS: Found $STUDENT_COUNT student(s) in students.md."
  exit 0
else
  echo "FAIL: No valid student entries found."
  echo "Hint: Add a line like: - Your Name (StudentID)"
  exit 1
fi
