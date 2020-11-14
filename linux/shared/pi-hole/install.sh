#!/bin/bash

# Define variables
INSTALL_DIR="/home/$(id -u -n)/pi-hole"
echo "[] Installing in directory: $INSTALL_DIR"

# Install docker
echo -n "[] Running apt update..."
sudo apt clean &> /dev/null
sudo apt update --fix-missing -y &> /dev/null
echo " done"

echo -n "[] Installing docker as pre-requisite..."
sudo apt install -y docker.io &> /dev/null
if [[ $? -eq 1 ]]; then
    printf "\n   > Docker installation failed. Please try again."
    exit 1
fi
echo " done"

# Create installation directory
echo "[] Creating installation directory if not exists..."
mkdir -p $INSTALL_DIR

# Download latest pihole image
echo "[] Downloading latest pihole image..."
sudo docker pull pihole/pihole:latest

# Download latest docker-run.sh
echo "[] Downloading latest docker-run.sh to installation directory..."
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/linux/shared/pi-hole/res/docker-run.sh -o $INSTALL_DIR/docker-run.sh

# Granting access to docker-run.sh as executable
chmod +x $INSTALL_DIR/docker-run.sh
