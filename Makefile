NAME = inception

SRC = docker-compose.yml


$(NAME): all

all: clean up

up:
	mkdir -p /home/jtomala/data/wordpress_volume
	mkdir -p /home/jtomala/data/mariadb_volume
	@echo "Building containers for $(NAME)..."
	docker-compose -f $(SRC) up -d --build
	@echo "$(NAME) is now up and running!"

down:
	@echo "Shutting down containers for $(NAME)..."
	docker-compose -f $(SRC) down
	@echo "Pulled down $(NAME)!"

clean: down
	@echo "Pruning containers and images for $(NAME)..."
	docker system prune -af
	@echo "Cleaned up, volumes still exist for $(NAME)!"

fclean: clean
	@echo "Removing all volumes AND MOUNTED DIRECTORIES for $(NAME)..."
	docker volume rm -f mariadb_volume
	docker volume rm -f wordpress_volume
	sudo rm -rf /home/jtomala/data/wordpress_volume
	sudo rm -rf /home/jtomala/data/mariadb_volume
	@echo "Removed all volumes for $(NAME)!"

re: clean up

destroy: fclean up

.PHONY: all up down clean re