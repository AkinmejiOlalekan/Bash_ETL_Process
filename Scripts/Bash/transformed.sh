#!/bin/bash

# The output filename for the transformed data
OUTPUT_FILE="./transformed/2023_year_finance.csv"

# Writing the needed columns into the output file
if awk -F ',' '{print $1, $9, $5, $6}' OFS=',' ./raw/annual-enterprise-survey-2023-financial-year-provisional.csv > "$OUTPUT_FILE"; then
	echo "File successfully saved to transformed folder"
else
	echo "Failed to move file to transform file"
fi

