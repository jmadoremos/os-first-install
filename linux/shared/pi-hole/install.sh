#!/bin/bash

# Create ~/pi-hole directory if not exists
echo "[] Creating ~/pi-hole directory, if not exists..."
mkdir ~/pi-hole &> /dev/null

# Download latest docker-compose.yml
echo "[] Downloading latest docker-compose.yml..."
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/linux/shared/pi-hole/res/docker-compose.yml -o ~/pi-hole/docker-compose.yml &> /dev/null

# Download latest start.sh
echo "[] Downloading latest start.sh..."
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/linux/shared/pi-hole/res/start.sh -o ~/pi-hole/start.sh &> /dev/null
