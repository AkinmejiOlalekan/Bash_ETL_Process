#!/bin/bash


#########=======This part of the scripts copy the downloaded csv  files from my local machine into Ubuntu path==========############
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# The Source folder
SOURCE_PATH="/mnt/c/Users/User/Documents/Linux_files"

# Destination folder
DESTINATION_PATH="./database_csv"


# Created the destination folder in this format to be on the safer side
mkdir -p "$DESTINATION_PATH"

# Moving csv files from my local machine to my Ubuntu directory
for file in $SOURCE_PATH/*.csv; do
	# Check if csv file exists in the source folder
	if [ -e $file ]; then
		filename=$(basename "$file")
		destination=$DESTINATION_PATH/$filename

		# check for duplicates
		if [ -e $destination ]; then
			echo "Skip: $filename already exists in the destination"
		else
			cp "$file" "$DESTINATION_PATH"
			echo "Successfully moved $filename"
		fi
	fi
done


#########=======This part of the script itereate through my csv file path and copy the files into posey database==========############
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# PostgreSQL connection details
DB_NAME="posey"
DB_USER="posey_user"


# Directory containing the csv files
CSV_DIR=$DESTINATION_PATH

# Setting a status flag variable to track commands success
all_success=true


# Loop through each of the files in the directory
for csv_file in $CSV_DIR/*.csv; do 
	# Extracting file names so as to use them as table name
	tablename=$(basename "$csv_file" .csv)
	
	echo "Importing $csv_file into posey database, $tablename"
	
	# Used the psql \COPY command to import the data into my database
	psql -U $DB_USER -d $DB_NAME -h localhost -W -c "\COPY \"$tablename\" FROM '$csv_file' DELIMITER ',' CSV HEADER;"

	# Provide the logging message of the process status
	if [ $? -eq 0 ]; then
		echo "Successfully imported  $csv_file."
	else 
		echo "Error importing $csv_file."
		all_success=false
	fi
done

if [ "$all_success" = true ]; then
	echo "All CSVs imported successfully, Deleting source folder: $CSV_DIR
	rm -rf "$CSV_DIR"
else
	echo "Failed to import csv into $DBNAME"
