#!/bin/bash

set -e

# Requirements:
# 1. Have s3cmd installed. Homebrew on macOS or download zip from GitHub: https://s3tools.org/download
# 
# 2. Set environment variables:
# DIGITAL_OCEAN_SPACES_ACCESS_KEY - access key to DigitalOcean spaces
# DIGITAL_OCEAN_SPACES_ACCESS_SECRET - access secret to DigitalOcean spaces
# DIGITAL_OCEAN_SPACES_NAME - Name of space you created
#
# Optional:
# DIGITAL_OCEAN_SPACES_HOST - Hostname of where your space is located. Defaults to `nyc3.digitaloceanspaces.com`

DIGITAL_OCEAN_SPACES_HOST=${DIGITAL_OCEAN_SPACES_HOST:-nyc3.digitaloceanspaces.com}

s3cmd --host-bucket="%(bucket)s.$DIGITAL_OCEAN_SPACES_HOST" --region=US --host=$DIGITAL_OCEAN_SPACES_HOST --access_key=$DIGITAL_OCEAN_SPACES_ACCESS_KEY --secret_key=$DIGITAL_OCEAN_SPACES_ACCESS_SECRET getlifecycle s3://$DIGITAL_OCEAN_SPACES_NAME