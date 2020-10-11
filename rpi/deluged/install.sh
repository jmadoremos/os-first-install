#!/bin/bash

echo -n "[] Running apt update..."
sudo apt clean &> /dev/null
sudo apt update --fix-missing -y &> /dev/null
echo " done"

echo -n "[] Installing deluged..."
sudo apt install -y deluged deluge deluge-console python-mako deluge-web &> /dev/null
echo " done"
