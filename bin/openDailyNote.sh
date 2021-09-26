#!/bin/bash

PROJECT_PATH=${1:-"."}
DATE=${2:-"$(date)"}
TEXT_EDITOR=${3:-"vim"}

TEX_PATH=$($PROJECT_PATH/bin/dailyNotePath.sh "$PROJECT_PATH" "$DATE") 

if ! test -f "$TEX_PATH"; then
  mkdir -p "$PROJECT_PATH/tex/$($PROJECT_PATH/bin/semesterName.sh "$DATE")/$($PROJECT_PATH/bin/weekName.sh "$DATE")"
  ISO_DATE=$(date -I -d "$DATE")
  TEMPLATE=$PROJECT_PATH/templates/day.tex
  $PROJECT_PATH/bin/prepare_todays_note.py $TEMPLATE $TEX_PATH --date $ISO_DATE
  $PROJECT_PATH/bin/createAllNotesSubfile.py --project_path $PROJECT_PATH
fi

$TEXT_EDITOR $TEX_PATH

