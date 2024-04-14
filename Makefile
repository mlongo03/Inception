
all : up

clean : down

re : down up

up:
	@sudo docker-compose -f srcs/docker-compose.yml up -d --build

down:
	@sudo docker-compose -f srcs/docker-compose.yml down -v --rmi all
	@sudo rm -rf /home/manuele/data/wordpress/*
	@sudo rm -rf /home/manuele/data/mariadb/*

stop:
	@sudo docker-compose -f srcs/docker-compose.yml stop

start:
	@sudo docker-compose -f srcs/docker-compose.yml start

status:
	@sudo docker ps -a

image:
	@sudo docker image ls

volume:
	@sudo docker volume ls

logs:
	@echo "\nlogs of wordpress\n--------------------------------------------\n"
	@sudo docker logs wordpress
	@echo "\nlogs of nginx\n--------------------------------------------\n"
	@sudo docker logs nginx
	@echo "\nlogs of mariadb\n--------------------------------------------\n"
	@sudo docker logs mariadb
