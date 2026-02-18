#!/bin/bash
mkdir attendance_tracker_v1
touch attendance_tracker_v1/attendance_checker.py
mkdir attendance_tracker_v1/Helpers
touch attendance_tracker_v1/Helpers/assets.csv
touch attendance_tracker_v1/Helpers/config.json
mkdir attendance_tracker_v1/reports
touch attendance_tracker_v1/reports/reports.log

File_Configuration="attendance_tracker_v1/Helpers/config.json"
echo "Do you want to update attendance thresholds? (y/n)"
read answer

if [ "$answer" = "y" ]; then

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

cleanup(){
	echo "Backing up progress..."
	archive_name="attendance_tracker_v1_archive.tar.gz"
	tar -czf "$archive_name" "attendance_tracker_v1"
	echo "Progress archived as $archive_name"
	rm -rf "attendance_tracker_v1"
	echo "Unfinished directory deleted"
	exit 1
}
trap cleanup SIGINT
echo "Loading..."
sleep 6 #simulate long work
echo "Done successfully"

echo "Running Health Check..."
echo "Scanning for Python3..."

if python3 --version>/dev/null 2>&1; then
	echo "Python3 is installed."
else
	echo "Warning: Python3 is NOT installed."
fi
