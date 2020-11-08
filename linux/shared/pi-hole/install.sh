#!/bin/bash

# Install docker
echo -n "[] Running apt update..."
sudo apt clean &> /dev/null
sudo apt update --fix-missing -y &> /dev/null
echo " done"

echo -n "[] Installing docker as pre-requisite..."
sudo apt install -y docker.io &> /dev/null
echo " done"

# Install virtualenv
echo -n "[] Installing virtualenv as pre-requisite..."
pip install virtualenv &> /dev/null
echo " done"

# Cleanup ~/pi-hole
if [ -d "~/pi-hole" ]; then
    echo "[] Deleting ~/pi-hole directory..."
    sudo rm ~/pi-hole --recursive
fi

# Create ~/pi-hole directory
echo "[] Creating ~/pi-hole directory..."
mkdir ~/pi-hole &> /dev/null

echo "[] Configuring ~/pi-hole..."
cd ~/pi-hole &> /dev/null
virtualenv venv
source venv/bin/activate

# Install docker-compose
echo -n "[] Installing docker-compose as pre-requisite..."
pip install docker-compose &> /dev/null
deactivate
echo " done"

# Download latest docker-compose.yml
echo "[] Downloading latest docker-compose.yml to ~/pi-hole..."
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/linux/shared/pi-hole/res/docker-compose.yml -o ~/pi-hole/docker-compose.yml

# Download latest start.sh
echo "[] Downloading latest start.sh to ~/pi-hole..."
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/linux/shared/pi-hole/res/start.sh -o ~/pi-hole/start.sh

# Granting access to ~/pi-hole/start.sh as executable
chmod +x ~/pi-hole/start.sh
