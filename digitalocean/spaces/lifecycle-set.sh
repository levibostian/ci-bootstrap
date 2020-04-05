#!/bin/bash

set -e

# Usage: lifecycle-set.sh path/to/lifecycle.xml 
# An example of a lifecycle: https://developers.digitalocean.com/documentation/spaces/#create-bucket-lifecycle
#
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

echo "Setting policy to: $1"

s3cmd --host-bucket="%(bucket)s.$DIGITAL_OCEAN_SPACES_HOST" --region=US --host=$DIGITAL_OCEAN_SPACES_HOST --access_key=$DIGITAL_OCEAN_SPACES_ACCESS_KEY --secret_key=$DIGITAL_OCEAN_SPACES_ACCESS_SECRET setlifecycle $1 s3://$DIGITAL_OCEAN_SPACES_NAME