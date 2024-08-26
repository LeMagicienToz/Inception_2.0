NAME	=	inception

all:
	@printf "Launch configuration ${NAME}...\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@printf "Building configuration ${NAME}...\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker=compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@printf "Stopping configuration ${NAME}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re: down
	@printf "Rebuild configuration ${NAME}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@printf "Cleaning configuration ${NAME}...\n"
	@docker system prune -a

fclean:
	@printf "Total clean of all configurations docker\n"
	@for container in $$(docker ps -aq); do \
		docker stop $$container; \
	done
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

.PHONY	:	all build down re clean fclean

