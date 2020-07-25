import boto3
import csv
import os

# Set variables for within container
awsRegion = os.environ['AWS_REGION']
inp_file_path = '/prowler/prowler_report.csv'
out_file_name = 'prowler_report.csv' # name of the file to upload
bucket_name = 'prowlerresults' # name of the bucket

# Upload the file to S3 bucket
s3_client = boto3.client('s3')
response = s3_client.upload_file(inp_file_path, bucket_name, out_file_name)