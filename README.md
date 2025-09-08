# CoreDataEngineers Bash ETL Process

## Overview

This project is a Data Engineering assignment completed at CoreDataEngineers. The tasks focused on building ETL pipelines with Bash scripting, automating 
workflows with cron jobs, handling file operations, and integrating PostgreSQL for data analysis.

The repository contains:

- Bash scripts for ETL, file movement, and database ingestion.

- SQL scripts for analytical queries on the Parch & Posey dataset.

- Documentation of steps taken to solve each task.

### TASK 1: ETL Pipeline with Bash

In this task, here are the steps involved in solving the task:

STEP 1: Created directories to hold the raw, transformed and loaded data.
```
mkdir raw   # for source data
mkdir Transformed    # for the transformed data
mkdir Gold    # to hold the loaded data
```

STEP 2: Exported the source URL into an environment variable.

`export CSV_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"`

STEP 3: Created an [extract.sh](Scripts/Bash/extract.sh) file that contains the bash script that downloads the source data into the `raw` folder from the url.

STEP 4: I opened the csv file using `nano` command to manually rename the column Variable_code into variable_code, then created a [transformed.sh](Scripts/Bash/transformed.sh) script 
that will select a specified columns from our source csv file which includes, year, Value, Units, variable_code into a new file name, 2023_year_finance.csv and store it in a folder 
named `Transformed`. The script also has a logging message that confirms the loading of the file into the `Transformed` folder.

STEP 5: Created a [load.sh](Scripts/Bash/load.sh) file that loads the csv file from `Transformed` folder into `Gold` folder with a logging message confirming it success.


### TASK 2: Scheduling with Cron
I created a cron job using the command, `crontab -e` but saved the cron job command in [cron_job.sh](Scripts/Bash/cron_job.sh) file for sharing purpose, to set a schedule for the 
running of [extract.sh](Scripts/Bash/extract.sh), [transformed.sh](Scripts/Bash/transformed.sh) and [load.sh](Scripts/Bash/load.sh) script at 
12:00 AM every day and log the orchestration message in [cron.log](Scripts/Bash/cron_log) file for monitoring. In the crontab file, each of the script are not tiled to one another, they’re meant to run separately.

### TASK 3: File Movement Script 
Created a bash script [move_file.sh](Scripts/Bash/move_file.sh) that moves csv and json file samples from my local machine into `json_and_CSV` folder. This script only focuses 
on JSON and CSV files.

### TASK 4: PostgreSQL Database Integration
Created a robust bash script, [posey_db_script.sh](Scripts/Bash/posey_db_script.sh), this script picks csv files downloaded in a specified directory in my local machine and moves 
them to my Ubuntu directory, `database_csv` folder. During this process, the script also checks for duplicates when looping through `database_csv` folder to pick all the csv files and 
load their data into my Postgres database, `posey`.

> NOTE: I opened my psql shell using `sudo -u postgres psql` to create my database, user and password. 
> After that, I log in to my database using `psql -U posey_user -d posey -h localhost -W` to create tables before loading my data inside the database.

### TASK 5: Posey analysis question solutions
The following question's solution was saved in [SQL_solution.sql](Scripts/SQL/SQL_solution.sql) file:

- Find a list of order IDs where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.

- Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.

- Find all the company names that start with a 'C' or 'W', and where the primary contact contains 'ana' or 'Ana', but does not contain 'eana'.

- Provide a table that shows the region for each sales rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the
  accounts alphabetically (A-Z) by account name.

