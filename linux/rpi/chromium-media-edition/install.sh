#!/bin/bash

echo -n "[] Downloading installer..."
curl -fsSL https://pi.vpetkov.net -o ~/Downloads/ventz-media-pi &> /dev/null
echo " done"

echo -n "[] Installing chromium (media edition)..."
sh ~/Downloads/ventz-media-pi &> /dev/null
echo " done"

echo -n "[] Removing installer..."
rm ~/Downloads/ventz-media-pi &> /dev/null
echo " done"

echo "[] Rebooting in 1 minute..."
sudo shutdown -r
