#!/bin/bash

# This script contain the cron job that I scheduled for the ETL process script. Each of the script runs independently of each other
0 0 * * * /home/olalekan/coredata/assignment_linux/extract.sh >> /home/olalekan/coredata/assignment_linux/cron.log 2>&1 ; /home/olalekan/coredata/assignment_linux/transformed.sh >> /home/olalekan/coredata/assignment_linux/cron.log 2>&1 ; /home/olalekan/coredata/assignment_linux/load.sh >> /home/olalekan/coredata/assignment_linux/cron.log 2>&1
