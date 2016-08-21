#!/bin/bash

VERSION=$(cat version.txt | xargs)
DOCKER_VERSION=${VERSION}~trusty

# Install dependencies
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

# Configure APT
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sudo bash -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list'

# Install docker
sudo apt-get update
sudo apt-get install -y docker-engine=${DOCKER_VERSION}

# Clean up
sudo rm -rf /var/lib/apt/lists/*

# User config
sudo groupadd docker
sudo usermod -aG docker $USER
