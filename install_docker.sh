#!/bin/bash
#
# PRE-REQS (Removing previous installs)
# $ sudo apt-get remove docker docker-engine docker.io containerd runc
# $ sudo chmod a+x install_docker.sh
# $ ./install_docker.sh
# PURPOSE
# Install Docker and Docker-Compose and enable for non-sudo
# POST
# Reboot
# $ sudo systemctl enable docker

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable" 
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo curl -L "https://github.com/docker/compose/releases/download/1.28.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo groupadd docker
sudo usermod -aG docker $USER
docker --version
docker-compose --version
echo "Reboot and $ sudo systemctl enable docker"
