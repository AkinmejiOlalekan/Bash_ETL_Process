#!/bin/bash

# The Source folder
SOURCE_PATH="/mnt/c/Users/User/Documents/Linux_files"

# Destination folder
DESTINATION_PATH="./json_and_csv"

# Created the destination folder in this format to be on the safer side
mkdir -p $DESTINATION_PATH

# Moving my json and csv files from my local machine to my Ubuntu directory
mv $SOURCE_PATH/*.json $SOURCE_PATH/*.csv $DESTINATION_PATH

# Logging the processing status
if [ $? -eq 0 ]; then
	echo "All files successfully moved to the desired location"
else
	echo "Error: Fails failed to be moved to the desired location"
fi
