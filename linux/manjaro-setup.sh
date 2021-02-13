#!/bin/sh

# Set Git Globals
git config --global user.email ""
git config --global user.name ""

# Install VSCode
sudo pacman -S snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install code --classic
