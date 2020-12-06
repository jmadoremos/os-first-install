#!/bin/bash

echo -n "[] Running apt update..."
sudo apt clean &> /dev/null
sudo apt update --fix-missing -y &> /dev/null
echo " done"

echo -n "[] Installing docker..."
sudo apt install -y docker.io &> /dev/null
if [[ $? -eq 1 ]]; then
    echo ""
    echo "   > Docker installation failed. Please try again."
    exit 1
fi
echo " done"

echo "Configuring docker..."
sudo usermod -aG docker $(id -un)

echo "Installation is complete. Reboot is required!"
sudo reboot
