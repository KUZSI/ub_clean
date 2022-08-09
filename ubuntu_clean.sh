#!/bin/bash
echo "Clean unused package and cache"
sudo apt-get autoclean
echo "Clean unused dependencies"
sudo apt-get autoremove
echo "Clean old config files"
sudo apt -f install
dpkg --list | grep linux-image
dpkg --list | grep linux-headers
echo "Run sudo apt-get purge linux-image-x.x.x"
echo "Run sudo apt-get purge linux-headers-x.x.x"
sudo dpkg -l | awk '/^rc/ {print $2}' | xargs sudo dpkg --purge
echo "System cleaned OK!!!"
