#!/bin/bash

set -e

# Requirements:
# 1. Have Docker installed. If you're using ECR, I will assume that's done!
# 
# 2. Set environment variables:
# AWS_ACCESS_KEY_ID - IAM user account key id
# AWS_SECRET_ACCESS_KEY - IAM user account key secret
# BUCKET_NAME - name of bucket. Example, "name-of-app-test-results"
# BUCKET_PATH - path to where to store the files in the bucket. Example, "/this/is/a/path"
# UPLOAD_PATH - path to the directory of files you would like to upload. Example, "path/to/your/local/files/" (can be relative path)
# 
# Optional variables:
# REGION - default region AWS commands will run against

REGION=${REGION:-us-east-1}

docker run --rm \
    -e KEY=$AWS_ACCESS_KEY_ID \
    -e SECRET=$AWS_SECRET_ACCESS_KEY \
    -e REGION=$REGION \
    -e BUCKET=$BUCKET_NAME \
    -e BUCKET_PATH=$BUCKET_PATH \
    -v $(pwd)/$UPLOAD_PATH:/data:ro \
    futurevision/aws-s3-sync now