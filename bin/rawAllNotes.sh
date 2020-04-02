#!/bin/bash

PROJECT_PATH=${1:-"."}

for SEMESTER in $(ls $PROJECT_PATH/tex); do
  for WEEK in $(ls $PROJECT_PATH/tex/$SEMESTER); do
    for DAY in $(ls $PROJECT_PATH/tex/$SEMESTER/$WEEK); do
      echo "\\subfile{\"tex/$SEMESTER/$WEEK/$DAY\"}"
    done
    # This weeks highlights
    echo "\\section{Weekly Highlights}"
    echo "Hours worked this week: \\DisplayWeeklyHours{}\\\\"
    echo "\\AddLifeTimeHours{}"
    echo "\\ResetWeeklyHours{}"
    echo "Hours worked in \"life time\": \\DisplayLifeTimeHours{}\\\\"
    echo "\\AddRequiredHours{}"
    echo "Hours required in \"life time\": \\DisplayHoursRequired{}"
    # New page between each week
    echo "\\clearpage"
  done
done
