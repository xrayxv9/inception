DOCKER_COMPOSE = docker compose
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

.PHONY:  all down clean fclean restart

all:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

down:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

clean: 
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v

fclean: clean
	docker system prune -a -f


restart: clean all
