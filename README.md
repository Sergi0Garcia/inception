# inception

This project aims to broaden your knowledge of system administration by using Docker.
You will virtualize several Docker images, creating them in your new personal virtual
machine.

## Rules

### `make dinstall`
Make rule to install doppler (https://www.doppler.com/) CLI to the VM

### `make dsetup`
Make rule to setup doppler project and environment in the VM. We need to have a DOPPLER_TOKEN in this part to set everything correclty. After setting doppler CLI and setting the project we can access the secrets in the terminal with `doppler secrets`

### `make denv`
Make rule to download all doppler secrets into a .env file in srcs/.env

### `make drun`
Make rule to run all Docker infra with doppler env files injected into docker compose. We do not need to download the env file for this command. Docker images are built if not created, we create our dir for our volumes and we also create our SSL certificates. 

### `make`
Make rule to run all Docker infra with .env file and docker compose. We NEED to download the env file for this command. Docker images are built if not created, we create our dir for our volumes and we also create our SSL certificates. 

### `make build`
Make rule to build all the Docker images (nginx, mariadb, wordpress 8.2) with docker compose

### `make down`
Make rule to bring the whole infra and containers down with docker compose

### `make clean`
Make rule to clean all the Docker images and docker containers

### `make fclean`
Make rule to to delete all Docker related stuff as make clean but it also deletes volumes, networks and images.


## Hacks
* `docker ps` Check all docker processes running
* `docker images` List all images created locally
* `docker volume ls` List all volumes
* `docker volume inspect <volume_name>` Extra info about volumes
* `docker network ls` List all networks
* `docker exec -it <container_id> sh` Jump into runnig container in interactive mode with entrypoint as sh
* `docker network inspect <network_id>` Shows extra info about the network config (Docker compose manages netwroking extremelly good)

## `docker network inspect <inception_netwrok>`

* ` "IPv4Address": "172.18.0.2/16" `
* ` "IPv4Address": "172.18.0.4/16" `
* ` "IPv4Address": "172.18.0.3/16" `
