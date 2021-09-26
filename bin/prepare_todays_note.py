#!/usr/bin/env python3
"""Prepare today's note from a template"""

__author__="Tyler Westland"

import argparse
import datetime
from dateutil.parser import isoparse
import os
import sys
from tasker.cli.todays_schedule import main as todays_schedule


def parse_arguments(args=None) -> None:
    """Returns the parsed arguments.

    Parameters
    ----------
    args: List of strings to be parsed by argparse.
        The default None results in argparse using the values passed into
        sys.args.
    """
    parser = argparse.ArgumentParser(
            description="A default template for python",
            formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("template_file", help="Path to the template.")
    parser.add_argument("output_file", help="Path to the output file.")
    parser.add_argument("-d", "--date", default=datetime.datetime.now(),
                        type=isoparse)
    args = parser.parse_args(args=args)
    return args


def main(template_file: str, output_file: str, date: datetime.date) -> int:
    """Main function.

    Parameters
    ----------
    template_file: str:
        Path the template file.
    output_file: str
        Path to the output file.
    date: datetime.date
        The date to modify the template for.
    Returns
    -------
    int
        The exit code.
    Raises
    ------
    FileNotFoundError
        Means that the input file was not found.
    """
    # Error check if the file even exists
    if not os.path.isfile(template_file):
        raise FileNotFoundError("File not found: {}".format(template_file))

    with open(template_file, 'r') as fin:
        todays_notes = fin.read()

    # Replace the date
    formatted_date = date.strftime("%A: %B %d, %Y")
    todays_notes =todays_notes.replace("DATE_REPLACE", formatted_date)

    # Replace the date keys
    formatted_date_key = date.strftime("%Y-%m-%d")
    todays_notes =todays_notes.replace("DATE_KEY_REPLACE",
                                       formatted_date_key)

    # Replace the schedule
    todays_notes =todays_notes.replace("SCHEDULE_REPLACE",
                                       todays_schedule(date).as_latex_list(3))

    with open(output_file, 'w') as fout:
        fout.write(todays_notes)


def cli_interface() -> None:
    """Get program arguments from command line and run main"""
    args = parse_arguments()
    try:
        sys.exit(main(**vars(args)))
    except FileNotFoundError as exp:
        print(exp, file=sys.stderr)
        sys.exit(-1)


# Execute only if this file is being run as the entry file.
if __name__ == "__main__":
    cli_interface()
