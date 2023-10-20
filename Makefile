NAME 		= inception
DOPPLER_PATH 	= /home/linuxbrew/.linuxbrew/Cellar/doppler/3.66.3/bin/doppler
DOPPLER_RUN  	= ${DOPPLER_PATH} run --

RED		= \e[31m
GREEN		= \e[92;5;118m
PURPLE 		= \e[95m
RESET		= \e[0m
CURSIVE		= \e[33;3m

all:
	@printf "$(CURSIVE)$(GREEN)- Building ${NAME} ...\n$(RESET)"
	@printf "$(CURSIVE)$(GREEN)- Creating DIRS for Volumes ...\n$(RESET)"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@printf "$(CURSIVE)$(PURPLE)- Launching docker-compose up ...\n$(RESET)"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@printf "$(CURSIVE)$(GREEN)- Building $(NAME) ...\n$(RESET)"
	@printf "$(CURSIVE)$(GREEN)- Creating DIRS for Volumes ...\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@printf "$(CURSIVE)$(PURPLE)- Launching docker-compose -- build ...\n$(RESET)"
	@${DOPPLER_RUN} docker-compose -f ./srcs/docker-compose.yml build

down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re:
	@printf "Rebuild configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

.PHONY	: all build down re clean fclean
