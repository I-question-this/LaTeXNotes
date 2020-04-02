#!/usr/bin/env python3
import argparse
import subprocess
import os

parser = argparse.ArgumentParser()
parser.add_argument("--project_path", default=".")
args = parser.parse_args()

with open(os.path.join(args.project_path, "templates", "allNotes.tex"), "r") as templateF:
  template = templateF.read()

results = subprocess.run([os.path.join(args.project_path, "bin", "rawAllNotes.sh"), args.project_path], stdout=subprocess.PIPE)
if results.returncode != 0:
  eprint(results.stderr)
  exit(results.returncode)

rawAllNotes = results.stdout

allNotesTex = template.replace("NOTES_REPLACE", rawAllNotes.decode())

with open(os.path.join(args.project_path, "allNotes.tex"), "w") as allNotesF:
  allNotesF.write(allNotesTex)

