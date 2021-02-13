#!/bin/sh

# Install VSCode
sudo apt update

sudo apt install curl gpg software-properties-common apt-transport-https

curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

sudo apt update

sudo apt install code

# Install Sublime-Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt update && sudo apt install sublime-text
