#!/bin/bash

sudo apt update && sudo apt upgrade -y
echo "update feito"

sleep 2
echo "instalar o docker"
sleep 2

sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get update -y
sudo apt-get install  \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

echo "docker instalado"
sleep 1


echo "instalar o docker-compose"
sudo apt install docker-compose
echo "docker-compose instalado"

sleep 1

echo "instalar o portainer"
sleep 2

sudo docker volume create portainer_data
sudo docker run -d -p 9000:9000 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest

sleep 2
echo "portainer instalado na porta 9000"
sleep 2

sudo mkdir /docker
sudo mv docker-compose.yml /docker
cd /docker

sleep 2
ls 
sleep 2

echo "Instalar os serviços, pode demorar alguns minutos"
sudo docker-compose up -d
echo "tudo instalado"

echo "servicos instlados, acede ao portainers para teres acederes"
echo "e necessario confirar as APIs e criar uma conta plex se ainda nao tiveres"
