#!/bin/bash

echo -n "[] Running apt update..."
sudo apt clean &> /dev/null
sudo apt update --fix-missing -y &> /dev/null
echo " done"

echo -n "[] Installing ufw..."
sudo apt install -y ufw gufw &> /dev/null
echo " done"

echo -n "[] Configuring ufw..."
sudo ufw enable &> /dev/null
sudo ufw allow to 22 from 192.168.254.0/24 &> /dev/null
sudo ufw allow to 5900 from 192.168.254.0/24 &> /dev/null
echo " done"
