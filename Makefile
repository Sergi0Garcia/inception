#------------------------------------------------------------------
NAME 		= inception
#------------------------------------------------------------------
DOPPLER_RUN  	= doppler run --
#------------------------------------------------------------------
RED		= \e[31m
GREEN		= \e[92;5;118m
PURPLE 		= \e[95m
RESET		= \e[0m
CURSIVE		= \e[33;3m
#-----------------------------------------------------------------
# ----------------------------------------------------------------
# 			DOPPLER
# ----------------------------------------------------------------			
# https://docs.doppler.com/docs/service-tokens
# ----------------------------------------------------------------

all:	
	@printf "$(CURSIVE)$(GREEN)- Building ${NAME} ...\n$(RESET)"
	@printf "$(CURSIVE)$(GREEN)- Creating DIRS for Volumes ...\n$(RESET)"
	@bash srcs/requirements/tools/make_dir.sh
	@printf "$(CURSIVE)$(GREEN)- Creating certificates SSL ...\n$(RESET)"
	@bash srcs/requirements/tools/make_certs.sh
	@printf "$(CURSIVE)$(PURPLE)- Launching docker-compose up ...\n$(RESET)"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

drun: 
	@printf "$(CURSIVE)$(GREEN)- Building with doppler ${NAME} ...\n$(RESET)"
	@printf "$(CURSIVE)$(GREEN)- Creating DIRS for Volumes ...\n$(RESET)"
	@bash srcs/requirements/tools/make_dir.sh
	@printf "$(CURSIVE)$(GREEN)- Creating certificates SSL ...\n$(RESET)"
	@bash srcs/requirements/tools/make_certs.sh
	@printf "$(CURSIVE)$(PURPLE)- Launching docker-compose up ...\n$(RESET)"
	@${DOPPLER_RUN} docker-compose -f ./srcs/docker-compose.yml up -d

build:
	@printf "$(CURSIVE)$(GREEN)- Building $(NAME) ...\n$(RESET)"
	@printf "$(CURSIVE)$(GREEN)- Creating DIRS for Volumes ...\n"
	@bash srcs/requirements/tools/make_dir.sh
	@printf "$(CURSIVE)$(GREEN)- Creating certificates SSL ...\n$(RESET)"
	@bash srcs/requirements/tools/make_certs.sh
	@printf "$(CURSIVE)$(PURPLE)- Launching docker-compose -- build ...\n$(RESET)"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env build

down:
	@printf "$(CURSIVE)$(RED)Stopping configuration ${NAME}...\n $(RESET)"
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@printf "$(CURSIVE)$(GREEN)Rebuild configuration ${NAME}...\n $(RESET)"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@printf "$(CURSIVE)$(RED)Cleaning docker ${NAME}... $(RESET)\n"
	@docker system prune --all --force

fclean:
	@printf "$(CURSIVE)$(RED)Cleaning all docker configurations ... $(RESET)\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force
	@docker network prune --force
	@docker volume rm $$(docker volume ls -q)

# -------------------------------------------------------------
# 			DOPPLER SETUP
# -------------------------------------------------------------			

dinstall:
	@printf "$(CURSIVE)$(GREEN)Installing Doppler CLI ... \n"
	@bash ./srcs/requirements/tools/install_doppler.sh

dsetup:
	@if [ -z "$(DOPPLER_TOKEN)" ]; then \
        	printf "$(CURSIVE)$(RED)[REQUIRED] DOPPLER_TOKEN NOT SET$(RESET)\n"; \
    	else \
        	printf "$(CURSIVE)$(GREEN)-Setting doppler in scope\n"; \
		doppler configure set token $(DOPPLER_TOKEN) --scope ./; \
    	fi
denv:
	@printf "$(CURSIVE)$(GREEN)- Downloading env files from doppler ...\n$(RESET)"
	@doppler secrets download --no-file --format docker > ./srcs/.env

# --------------------------------------------------------------

.PHONY	: all build down re clean fclean
