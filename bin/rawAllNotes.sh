#!/bin/bash

PROJECT_PATH=${1:-"."}

for SEMESTER in $(ls $PROJECT_PATH/tex); do
  for WEEK in $(ls $PROJECT_PATH/tex/$SEMESTER); do
    echo "\\section{$WEEK}"
    for DAY in $(ls $PROJECT_PATH/tex/$SEMESTER/$WEEK); do
      echo "\\subfile{\"tex/$SEMESTER/$WEEK/$DAY\"}"
    done
    # New line between each week
    echo ""
  done
done
