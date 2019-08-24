#!/bin/bash
# Get them numbers
dayOfWeekNumber=$(date +"%-u" -d "$1")
if ! [[ $? == 0 ]]; then
  exit 1
fi
# Check that we got numbers
if ! [[ "$dayOfWeekNumber" =~ ^[0-9]+$ ]]; then
  >&2 echo "$0: Day of week is not a number"
  exit 1
fi

mondayDate=$(date -d "$1 -$(($dayOfWeekNumber-1)) days")
sundayDate=$(date -d "$1 +$((7-$dayOfWeekNumber)) days")

echo "$(date +"%F" -d "$mondayDate")--$(date +"%F" -d "$sundayDate")"

