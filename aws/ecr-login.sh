#!/bin/bash

set -e

# Requirements:
# 1. Have Docker installed. If you're using ECR, I will assume that's done!
# 
# 2. Set environment variables:
# AWS_ACCESS_KEY_ID - IAM user account key id
# AWS_SECRET_ACCESS_KEY - IAM user account key secret
# 
# Optional variables:
# REGION - default region AWS commands will run against

REGION=${REGION:-us-east-1}

eval $(docker run --rm -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e REGION=$REGION levibostian/aws-cli aws ecr get-login --no-include-email --region $REGION)