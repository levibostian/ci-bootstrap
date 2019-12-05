#!/bin/bash

set -e

# Requirements:
# 1. Have Docker installed. If you're using ECR, I will assume that's done!
# 
# 2. Set environment variables:
# ENVIRONMENT - production, staging, etc.
# REPOSITORY - code repository in form of: github.com/repo/slug
# GIT_COMMIT - git hash for the git commit of deployment
# HONEY_BADGER_API_KEY - api key for honeybadger project
# 
# Optional variables:
# USERNAME - username of person doing the deployment (defaults to: ci-server)

USERNAME=${USERNAME:ci-server}

curl -ig \
    --data-urlencode "deploy[environment]=$ENVIRONMENT" \
    --data-urlencode "deploy[local_username]=$USERNAME" \
    --data-urlencode "deploy[repository]=https://$REPOSITORY" \
    --data-urlencode "deploy[revision]=$GIT_COMMIT" \
    --data-urlencode "api_key=$HONEY_BADGER_API_KEY" \
    https://api.honeybadger.io/v1/deploys 