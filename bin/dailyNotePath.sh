#!/bin/bash

PROJECT_PATH=${1:-"."}
DATE=${2:-"$(date)"}

echo "$PROJECT_PATH/tex/$($PROJECT_PATH/bin/semesterName.sh "$DATE")/$($PROJECT_PATH/bin/weekName.sh "$DATE")/$(date +"%F" -d "$DATE").tex"

