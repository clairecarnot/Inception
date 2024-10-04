all:
	mkdir -p /home/ccarnot/data/mariadb
	mkdir -p /home/ccarnot/data/wordpress
	mkdir -p /home/ccarnot/data/portainer
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker compose -f ./srcs/docker-compose.yml logs

clean:
	docker container stop nginx mariadb wordpress redis ftp static_site adminer portainer
	docker network rm inception

fclean: clean
	@sudo rm -rf /home/ccarnot/data/mariadb/*
	@sudo rm -rf /home/ccarnot/data/wordpress/*
	@sudo rm -rf /home/ccarnot/data/portainer/*
	@docker system prune -af

re: fclean all

.PHONY: all logs clean fclean
