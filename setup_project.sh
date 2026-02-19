#!/bin/bash
read -p "Type Directory Name: " input 
project_dir=attendance_tracker_$input
echo "${project_dir}"
mkdir -p $project_dir
touch $project_dir/attendance_checker.py
mkdir -p $project_dir/Helpers
touch $project_dir/Helpers/assets.csv
touch $project_dir/Helpers/config.json
mkdir -p $project_dir/reports
touch $project_dir/reports/reports.log

File_Configuration="$project_dir/Helpers/config.json"
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
	echo ""
	echo "Backing up progress..."
	
	if [ -d "$project_dir" ]; then
	archive_name="${project_dir}_archive.tar.gz"
	tar -czf "$archive_name" "$project_dir"
	echo "Progress archived as $archive_name"
	rm -rf "$project_dir"
	echo "Archive created and unfinished directory deleted."
else
	echo "No directory found to archive."
	
	fi

	exit 1
}
trap cleanup SIGINT
echo "Loading..."
sleep 5 #simulate long work
echo "Done successfully"

echo "Running Health Check..."
echo "Scanning for Python3..."

if python3 --version>/dev/null 2>&1; then
	echo "Python3 is installed."
else
	echo "Warning: Python3 is NOT installed."
fi
