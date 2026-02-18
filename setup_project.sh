#!/bin/bash
mkdir attendance_tracker_v1
touch attendance_tracker_v1/attendance_checker.py
mkdir attendance_tracker_v1/Helpers
touch attendance_tracker_v1/Helpers/assets.csv
touch attendance_tracker_v1/Helpers/config.json
mkdir attendance_tracker_v1/reports
touch attendance_tracker_v1/reports/reports.log

File_Configuration="config.json"
echo "Do you want to update attendance thresholds? (Y/N)"
read answer

if ["$answer"="Y"]; then

        echo "Enter Warning Threshold (default 75%):"
        read warning
        warning=${warning:-75}

        echo "Enter Failure Threshold (default 50%):"
        read failure
        failure=${failure:-50}

        #Perform an "in-place" edit
          sed -i '/"thresholds": {/,/}/ s/"warning": *[0-9]\+/"warning": '"$warning"'/' "$File_Configuration"
          sed -i '/"thresholds": {/,/}/ s/"failure": *[0-9]\+/"failure": '"$failure"'/' "$File_Configuration"
          echo "Thresholds updated successfully!"
          else
    echo "No changes made."
fi
