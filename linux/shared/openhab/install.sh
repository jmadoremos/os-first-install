#!/bin/bash

# Define variables
INSTALL_DIR="/home/$(id -u -n)/openhab"
OPENHAB_USER="openhab"
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

# Create system user with no home, no login
id -u $OPENHAB_USER &> /dev/null
if [[ $? -eq 1 ]]; then
    echo "[] User \"$OPENHAB_USER\" does not exist, creating user..."
    sudo useradd -r -s /sbin/nologin $OPENHAB_USER
    sudo usermod -a -G $OPENHAB_USER $(id -u -n)
fi

# Create installation directory
echo "[] Creating installation directory if not exists..."
mkdir -p $INSTALL_DIR &> /dev/null
mkdir -p $INSTALL_DIR/conf &> /dev/null
mkdir -p $INSTALL_DIR/userdata &> /dev/null
mkdir -p $INSTALL_DIR/addons &> /dev/null
sudo chown -R $OPENHAB_USER:$OPENHAB_USER $INSTALL_DIR

# Download latest openhab image
echo "[] Downloading latest openhab image..."
sudo docker pull openhab/openhab:latest

# Download latest docker-run.sh
echo "[] Downloading latest docker-run.sh to installation directory..."
sudo curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/linux/shared/openhab/res/docker-run.sh -o $INSTALL_DIR/docker-run.sh

# Granting access to docker-run.sh as executable
sudo chmod +x $INSTALL_DIR/docker-run.sh
