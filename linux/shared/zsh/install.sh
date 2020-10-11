#!/bin/bash

echo -n "[] Running apt update..."
sudo apt clean &> /dev/null
sudo apt update --fix-missing -y &> /dev/null
echo " done"

echo -n "[] Installing zsh..."
sudo apt install -y zsh zsh-common &> /dev/null
echo " done"

echo -n "[] Configuring zsh as default shell..."
zsh &> /dev/null
sudo chsh -s /bin/zsh &> /dev/null
echo " done"
