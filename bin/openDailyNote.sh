#!/bin/bash

PROJECT_PATH=${1:-"."}
DATE=${2:-"$(date)"}
TEXT_EDITOR=${3:-"vim"}

TEX_PATH=$($PROJECT_PATH/bin/dailyNotePath.sh "$PROJECT_PATH" "$DATE") 

if ! test -f "$TEX_PATH"; then
  mkdir -p "$PROJECT_PATH/tex/$($PROJECT_PATH/bin/semesterName.sh "$DATE")/$($PROJECT_PATH/bin/weekName.sh "$DATE")"
  DATE_TITLE=$(date +'%A: %B %-d, %Y' -d "$DATE")
  cat $PROJECT_PATH/templates/daily.tex | sed "s/DATE_REPLACE/$DATE_TITLE/g" > $TEX_PATH
  $PROJECT_PATH/bin/createAllNotesSubfile.py --project_path $PROJECT_PATH
fi

$TEXT_EDITOR $TEX_PATH

