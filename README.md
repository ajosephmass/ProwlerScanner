# ProwlerScanner

The integration works as follows:
- A CloudWatch event starts the Fargate task on the schedule specified.
- Fargate pulls a Prowler Docker image from Amazon Elastic Container Registry (ECR). You can utilize the DockerFile in the repo to create the image.
- Prowler scans your AWS infrastructure and writes the scan results to a CSV file and uploads it to the S3 bucket.

What's not included in the repo :
- CloudFormation templates to provision VPC, appropriate subnets, and IAM Roles that are required.
