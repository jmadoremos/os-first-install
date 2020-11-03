#!/bin/bash

echo -n "[] Running apt update..."
sudo apt clean &> /dev/null
sudo apt update --fix-missing -y &> /dev/null
echo " done"

echo -n "[] Installing dependencies..."
sudo apt install -y curl gpg software-properties-common apt-transport-https &> /dev/null
echo " done"

echo "[] Registering Microsoft GPG keys..."
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

echo "[] Adding Visual Studio Code to APT repository..."
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

echo -n "[] Installing visual studio code..."
sudo apt install -y code
echo " done"