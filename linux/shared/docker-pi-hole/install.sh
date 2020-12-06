#!/bin/bash

# Define variables
INSTALL_DIR="/home/$(id -u -n)/pi-hole"
echo "[] Installing in directory: $INSTALL_DIR"

# Create installation directory
echo "[] Creating installation directory if not exists..."
mkdir -p $INSTALL_DIR

# Download latest pihole image
echo "[] Downloading latest pihole image..."
sudo docker pull pihole/pihole:latest

# Download latest docker-run.sh
echo "[] Downloading latest docker-run.sh to installation directory..."
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/linux/shared/docker-pi-hole/res/docker-run.sh -o $INSTALL_DIR/docker-run.sh

# Granting access to docker-run.sh as executable
chmod +x $INSTALL_DIR/docker-run.sh
