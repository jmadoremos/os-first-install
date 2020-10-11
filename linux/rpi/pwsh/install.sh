#!/bin/bash

echo -n "[] Running apt update..."
sudo apt clean &> /dev/null
sudo apt update --fix-missing -y &> /dev/null
echo " done"

echo -n "[] Installing pre-requisites..."
sudo apt install -y '^libssl1.0.[0-9]$' libunwind8 &> /dev/null
echo " done"

echo "[] Downloading package release..."
curl https://github.com/PowerShell/PowerShell/releases/download/v7.1.0-rc.1/powershell-7.1.0-rc.1-linux-arm32.tar.gz -o ~/Downloads/powershell-7xx-linux-arm32.tar.gz -L

echo -n "[] Installing package..."
mkdir ~/powershell &> /dev/null
tar -xvf ./Downloads/powershell-7xx-linux-arm32.tar.gz -C ~/powershell &> /dev/null
echo " done"

echo -n "[] Performing cleanup..."
rm ./Downloads/powershell-7xx-linux-arm32.tar.gz
echo " done"
