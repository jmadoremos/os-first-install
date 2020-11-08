#!/bin/bash

# Install docker
echo -n "[] Running apt update..."
sudo apt clean &> /dev/null
sudo apt update --fix-missing -y &> /dev/null
echo " done"

echo -n "[] Installing docker as pre-requisite..."
sudo apt install -y docker.io &> /dev/null
echo " done"

# Create ~/pi-hole directory if not exists
echo "[] Creating ~/pi-hole directory, if not exists..."
mkdir ~/pi-hole &> /dev/null

# Download latest docker-compose.yml
echo "[] Downloading latest docker-compose.yml to ~/pi-hole..."
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/linux/shared/pi-hole/res/docker-compose.yml -o ~/pi-hole/docker-compose.yml

# Download latest start.sh
echo "[] Downloading latest start.sh to ~/pi-hole..."
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/linux/shared/pi-hole/res/start.sh -o ~/pi-hole/start.sh

# Granting access to ~/pi-hole/start.sh as executable
chmod +x ~/pi-hole/start.sh
