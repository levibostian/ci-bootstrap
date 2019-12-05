#!/bin/bash

set -e

# Requirements:
# * Set DOCKER_COMPOSE_VERSION to version of Docker Compose you want to install. 
#   View versions at: https://github.com/docker/compose/releases

sudo rm /usr/local/bin/docker-compose
curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > docker-compose
chmod +x docker-compose
sudo mv docker-compose /usr/local/bin
docker-compose version