# totalmedia
Script isntalar o docker.io, docker-compose e Portainer via apt , apt get e 'docker run'

Containers instalados via docker-compose.

Serviços que instala:
  - Docker.io
  - Docker-Compose
  - Portainer
  - Watchtower
  - Plex
  - Transmission
  - ARR's:
    - Sonarr
    - Radarr
    - Overseerr
    - Bazarr
    - Prowlarr

Local para instalação e definido no script e no ficheiro docker-compose.yml
Por defeito é:
  - /docker/Configs/NOME-DA-APP:/config -- Pasta config de cada serviço
  - /docker/Media/Filmes:/media/Filmes -- Pasta para filmes
  - /docker/Media/Series:/media/Series -- Pasta para series
  - /docker/Torrents(*):/media/Downloads -- Pasta onde vai ser feito o download dos torrents

(*) O transmission cria duas pastas, uma para download completos e outra para downloads em progresso. Isto e gerido pelo transmission de forma automatica. 


Fazer o downalod e instalar com comando wget 

wget https://github.com/nmfreitas/totalmedia/archive/refs/heads/master.zip && unzip master && cd ./totalmedia-master && sudo chmod +x docker.sh && ./docker.sh