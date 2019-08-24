#!/bin/bash

# Get them numbers
monthNumber=$(date +"%-m" -d "$1")
if ! [[ $? == 0 ]]; then
  exit 1
fi
yearNumber=$(date +"%-Y" -d "$1" 2> /dev/null)

# Check that we got numbers
if ! [[ "$monthNumber" =~ ^[0-9]+$ ]]; then
  >&2 echo "$0: Month is not a number"
  exit 1
fi

if ! [[ "$yearNumber" =~ ^[0-9]+$ ]]; then
  >&2 echo "$0: Year is not a number"
  exit 1
fi

# Return the value
if [ "$monthNumber" -lt "5" ]; then
  echo "$yearNumber--01--04--Spring"
elif [ "$monthNumber" -lt "9" ]; then
  echo "$yearNumber--05--08--Summer"
elif [ "$monthNumber" -lt "12" ]; then
  echo "$yearNumber--09--12--Fall"
else
  >&2 echo "$0: Month greater than 12"
  exit 1
fi

