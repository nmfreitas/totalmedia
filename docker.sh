#!/bin/bash

BLUE='\033[0;34m'
NC='\033[0m'

sudo apt update && sudo apt upgrade -y # update and upgrade apt 
echo -e "${BLUE}Update feito${NC}"

sleep 1
echo -e "${BLUE}Instalar o Docker${NC}"
sleep 1

sudo apt-get remove docker docker-engine docker.io containerd runc -y #remove older version of docker
sudo apt-get update -y
sudo apt-get install  \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y #install repositories
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg  | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y #update apt-get
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y #intall docker 

echo -e "${BLUE}Docker instalado${NC}"
sleep 1
echo -e "${BLUE}Instalar o docker-compose${NC}"
sleep 1

sudo apt install docker-compose -y #install docker-compose

echo -e "${BLUE}Docker-compose instalado${NC}"
echo -e "${BLUE}Instalar o Portainer${NC}"
sleep 1

sudo docker volume create portainer_data
sudo docker run -d -p 9000:9000 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest

sleep 1
echo -e "${BLUE}Portainer instalado${NC}"
sleep 1

sudo mkdir /docker
sudo mv docker-compose.yml /docker
cd /docker


sleep 1
ls 
sleep 1

echo -e "${BLUE}Instalar os servicos, pode demorar alguns minutos${NC}"
sleep 1
sudo docker-compose up -d
echo -e "${BLUE}Tudo instalado${NC}"
sleep 1

echo "Acede a ${BLUE}http://localhost:9000${NC} para criar um utilizador no Portainer e teres acesso rapido e facil aos containers"
sleep 1
echo "Links das apps:"
echo "Portianer: " " ${BLUE}http://localhost:9000${NC}"
echo "Radarr: " " ${BLUE}http://localhost:7878${NC}"
echo "Sonarr: " " ${BLUE}http://localhost:8989${NC}"
echo "Prowlarr: " "${BLUE}http://localhost:9696 ${NC}"
echo "Overseerr: " " ${BLUE}http://localhost:5055${NC}"
echo "Bazarr: " "${BLUE}http://localhost:6767 ${NC}"
echo "Transmission: " " ${BLUE}http://localhost:9091${NC}"
echo "Plex: " " ${BLUE}http://localhost:32400/web${NC}"