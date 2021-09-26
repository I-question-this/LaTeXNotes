# LaTeX Daily Notes

# Install
Uses a script from another of my repos:
[tasker](https://github.com/I-question-this/tasker).
Installing it is required, unless you want to instead modify 
`bin/prepare_todays_note.py` to import it in some other way.

# Usage:
## Editing a Single Day's File
The main point of usage is to run the `bin/openDailyNote.sh` script.
Without an argument it creates and presents the file for the current day.
One can pass in any valid argument to the `date` utility to access other day's
files as well though.
Note that this template is intended to make use of time tracking for daily hours
of work via the `hoursWorkedToday` command. Removal of that functionality is 
possible, but it is spread through out the setup.

# Modifying the Daily Template
One can modify the template in `tempaltes/day.tex` to add or remove sections.

# Modifying Suggested Daily Schedule
I keep track of things I do down to the 15 minute level, but a script helps.
The `tasker_data/data.json` contains events that will occur on each day, and
it fills in ???? events in between them. 
Editing this file will allow you to do the same.
I find that planning how one will spend there day, even if only the
next 3 or 4 hours, helps one not waste time.
