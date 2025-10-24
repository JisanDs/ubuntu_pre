#!/bin/bash
# -------------------------------------------
# install_essentials.sh
# Basic system tools + multimedia + browser
# -------------------------------------------

# update package list
sudo apt update -y

# upgrade system
sudo apt upgrade -y

# basic tools
sudo apt install -y git curl wget gnome-tweaks unzip htop

# multimedia (VLC + codecs)
sudo apt install -y vlc ubuntu-restricted-extras

# browsers (Google Chrome)
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Cleanup extra
sudo apt autoremove -y
sudo apt clean

echo "All essential tools installed successfully!"
