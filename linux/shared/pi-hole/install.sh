#!/bin/bash

# Install docker
echo -n "[] Running apt update..."
sudo apt clean &> /dev/null
sudo apt update --fix-missing -y &> /dev/null
echo " done"

echo -n "[] Installing docker as pre-requisite..."
sudo apt install -y docker.io &> /dev/null
echo " done"

# Cleanup ~/pi-hole
if [ -d "~/pi-hole" ]; then
    echo "[] Deleting ~/pi-hole directory..."
    sudo rm ~/pi-hole --recursive
fi

# Create ~/pi-hole directory
echo "[] Creating ~/pi-hole directory..."
mkdir ~/pi-hole &> /dev/null

# Download latest docker-compose.yml
echo "[] Downloading latest docker-compose.yml to ~/pi-hole..."
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/linux/shared/pi-hole/res/docker-run.sh -o ~/pi-hole/docker-run.sh

# Granting access to ~/pi-hole/docker-run.sh as executable
chmod +x ~/pi-hole/docker-run.sh
