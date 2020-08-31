#!/bin/bash

set -e

# https://cloud.google.com/storage/docs/gsutil/addlhelp/CRC32CandInstallingcrcmod

# Requirements:
# * `gsutil` is already installed. Travis has it installed by default for you. 
# * `pip` is already installed. gsutil may be using python2 or python3. This script runs a command for you to output the version of python that gsutil is using. Read the script below to learn more. 
# * It's recommended that you call `sudo ip install --upgrade pip` before running this script. 
# 
# Optional:
# * PIP_BIN=pip3 - if you need to use a different version of pip instead of the default `pip`, provide it with this variable. 

PIP_BIN=${PIP_BIN:-pip}

# Print info about gsutil. This allows you to see what version of python it runs and other info. 
echo "gsutil version BEFORE crcmod install"
gsutil version -l 

sudo $PIP_BIN install --no-cache-dir -U --ignore-installed crcmod

echo "gsutil version AFTER crcmod install"
gsutil version -l 

echo "Testing crcmod native got installed correctly."
gsutil version -l | grep -q "compiled crcmod: True"