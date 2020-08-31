#!/bin/bash

set -e

# Requirements:
# * `gsutil` is already installed. Travis has it installed by default for you. 
# * `pip` is already installed. gsutil may be using python2 or python3. This script runs a command for you to output the version of python that gsutil is using. Read the script below to learn more. 
# * It's recommended that you call `pip install --upgrade pip` before running this script. 
# 
# Optional:
# * PIP_BIN=pip3 - if you need to use a different version of pip instead of the default `pip`, provide it with this variable. 

PIP_BIN=${PIP_BIN:-pip}

sudo $PIP_BIN uninstall crcmod || true 
sudo $PIP_BIN install crcmod

echo "Testing crcmod native got installed correctly."
gsutil version -l | grep -q "compiled crcmod: True"