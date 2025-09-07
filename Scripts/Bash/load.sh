#!/bin/bash


# Loading from trransformed folder
SOURCE="./Transformed"

# Destination folder 
PATH_DIR="./Gold"

# Created destination folder
mkdir -p $PATH_DIR


# Checked files in the source folder and load into Gold folder
for file in $SOURCE/*; do
	# Loaded the filename from tranformed folder
	filename=$(basename $file)
	filepath="$PATH_DIR/$filename"

	# Checked if the file already exist to avoid duplicates
	if [ -f $filepath ]; then
        	echo "File $filename already exists in $PATH_DIR"
        	exit 0
	else
		# Load the data if it doesn't exist yet
		cp $file $PATH_DIR
		if [ $? -eq 0 ]; then
			echo "Successfully load $file into $PATH_DIR"
		else
			echo "Error: Filed to load $file into $PATH_DIR"
		fi
	fi
done
