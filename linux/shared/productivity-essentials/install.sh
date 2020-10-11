#!/bin/bash

echo -n "[] Running apt update..."
sudo apt clean &> /dev/null
sudo apt update --fix-missing -y &> /dev/null
echo " done"

echo -n "[] Installing productivity essentials..."
sudo apt install -y fonts-firacode guake htop nethogs p7zip-full
echo " done"
