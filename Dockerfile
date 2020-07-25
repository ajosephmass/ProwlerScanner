FROM python:latest

# Declar Env Vars
ENV AWS_REGION=AWS_REGION

# Install Dependencies
RUN \
    apt update && \
    apt upgrade -y && \
    pip install awscli && \
    apt install -y python3-pip && \
    apt install -y jq && \
    pip install awscli detect-secrets

# Place scripts
ADD script.sh /root
ADD uploader.py /root

# Installs prowler, moves scripts into prowler directory
RUN \
    git clone https://github.com/toniblyx/prowler && \
    mv root/uploader.py /prowler && \
    mv root/script.sh /prowler

# Runs prowler and copy report to S3
WORKDIR /prowler
RUN pip3 install boto3
CMD bash script.sh
