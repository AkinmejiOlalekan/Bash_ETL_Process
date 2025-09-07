#!/bin/bash


# The destination fornthe extracted file
DESTINATION_PATH="./raw"

# Created destination directory
mkdir -p $DESTINATION_PATH

# Extracted the filename from URL
filename=$(basename $CSV_URL)
filepath="DESTINATION_PATH/$filename"

# Checked if the file already exist to avoid duplicates
if [ -f $filepath ]; then
	echo "File $filename already exists in $DESTINATION_PATH"
	exit 0
fi

# Downloaded the csv from the url
wget $CSV_URL -P $DESTINATION_PATH

# Log to know if the file is downloaded successfully
if [ $? -eq 0 ]; then
        echo "Sucessfully download $DESTINATION_PATH/ into raw folder"
else
        echo "Failed to download the csv"
fi
