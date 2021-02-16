#!/bin/sh

# Set Git Globals
git config --global user.email ""
git config --global user.name ""

# Install VSCode
sudo apt update

sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

# Install Intellij Community edition
sudo snap install intellij-idea-community --classic

# Install OpenJDK
sudo apt update
sudo apt install openjdk-11-jdk
java --version

# Install Node
sudo apt install npm

# Install Angular CLI
sudo npm install -g @angular/cli

# Install Firebase Tools
sudo npm install -g firebase-tools

# Install Postman
sudo snap install postman
