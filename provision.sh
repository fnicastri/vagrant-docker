#!/bin/bash

DOCKER_VERSION=1.7.1~trusty

sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sudo bash -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list'

sudo apt-get update
sudo apt-get install -y docker-engine=${DOCKER_VERSION}

sudo rm -rf /var/lib/apt/lists/*
