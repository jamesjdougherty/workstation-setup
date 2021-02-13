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

# Install Docker
sudo apt update
sudo apt install -y docker.io
sudo systemctl enable docker --now
docker

# Add self to docker group to nuke sudo commands
#sudo usermod -aG docker $USER

# Install RustScan v1.10.0
docker pull rustscan/rustscan.1.10.0

# Add aliases to env variables
#alias rustscan='sudo docker run -it --rm --name rustscan rustscan/rustscan:1.10.0'
