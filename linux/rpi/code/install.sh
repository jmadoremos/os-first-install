#!/bin/bash

echo -n "[] Running apt update..."
sudo apt clean &> /dev/null
sudo apt update --fix-missing -y &> /dev/null
echo " done"

echo -n "[] Installing vscode..."
curl -s https://packagecloud.io/install/repositories/headmelted/codebuilds/script.deb.sh | sudo bash &> /dev/null
curl -L https://raw.githubusercontent.com/headmelted/codebuilds/master/docs/installers/apt.sh | sudo bash &> /dev/null
echo " done"
