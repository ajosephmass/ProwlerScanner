#!/bin/bash
echo "Prowler Scans Execution"
./prowler -b -n -f us-east-1 -g extras -M csv > prowler_report.csv
echo "Loading the data to S3"
python uploader.py