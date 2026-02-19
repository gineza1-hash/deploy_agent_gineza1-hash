ATTENDANCE TRACKER SCRIPT

PROJECT OVERVIEW

This project is aimed at creating a master shell script (setup_project.sh) that automates the creation and enables editing of an attendance tracking application directory.The script:
1. Creates a parent directory named attendance_tracker_{input}.
2. Allows dynamic configuration of the files and editing.
3. Performs an environment validation health check.
4. Implements a signal trap to handle user interrupts.

DIRECTORY STRUCTURE CREATION

Once the script is run, it creates the parent directory, attendance_tracker_{input}; where {input} is the project name determined by the user.Then it creates the branch directories and files as follows:

```text
attendance_tracker_{input}/
├── attendance_checker.py
├── Helpers/
│   ├── assets.csv
│   └── config.json
└── reports/
    └── reports.log

REQUIREMENTS

1. Linux
2. Bash shell
3. python3

To check that python3 is installed, the script uses: "python3 --version" and then prints a successful message if it is and a warning if not.

RUNNING THE SCRIPT

1. Change commands to make script executable using:

chmod +x setup_project.sh

2. Run the script using either:

./setup_project.sh

or

bash setup_project.sh

3. Follow the following prompts:

-Enter directory name.
-Select Yes or No to update attendance thresholds.
-Wait for the setup complete.

DYNAMIC CONFIGURATION

Once the script prompts to choose whether user wants to update attendance thresholds and the user accepts yes, the script will ask for:
1. The Warning percentage and inform user that the default is 75%.
2. The Failure percentage and inform the user that the default is 50%.

Then, it will use the "sed" command to edit the "config.json" file to change the values inside and in-place. Meaning that it will change the actual file not a copy of it.

PROCESS MANAGEMENT (THE TRAP)

The trap that our script uses is "Ctrl + C" also known as a SIGINT.
If the user stops midway during the execution of the script by pressing the SIGINT;
1. The signal is caught.
2. The directory is archived as: 

"attendance_tracker_{input}_archive"

3. Deletes the unfinished folder.
4. Exits cleanly.

How to Test the Archive Feature

- Run the script
- Press Ctrl + C
- Confirm that an archive is created and the incomplete folder is removed.

ENVIRONMENT VALIDATION/HEALTH CHECK

Before finalizing the whole setup, the script verifies that python3 is installed and that the correct directory structure exists.

For more information and explanation, here is a demonstration video: 
