
all : up

clean : down

re : vclean up

reboot : down up

vclean: down
	@sudo rm -rf /home/manuele/data/wordpress/*
	@sudo rm -rf /home/manuele/data/mariadb/*
	@sudo rm -rf /home/manuele/data/adminer/*
	@sudo rm -rf /home/manuele/data/website/*

up:
	@if [ ! -f srcs/.env ]; then \
	touch srcs/.env ; \
	echo DOMAIN_NAME=${USER}.42.fr >> srcs/.env; \
	echo CERTS_=/etc/nginx/ssl/inception.crt >> srcs/.env; \
	echo KEYS_=/etc/nginx/ssl/inception.key >> srcs/.env; \
	echo WP_TITLE=${USER}WP >> srcs/.env; \
	echo WP_ADMIN_USR=${USER} >> srcs/.env; \
	echo WP_ADMIN_PWD=1234 >> srcs/.env; \
	echo WP_ADMIN_EMAIL=${USER}@gmail.com >> srcs/.env; \
	echo WP_USR=${USER}2 >> srcs/.env; \
	echo WP_EMAIL=${USER}@student.42roma.it >> srcs/.env; \
	echo WP_PWD=123 >> srcs/.env; \
	echo db_name=maria >> srcs/.env; \
	echo db_user=ss >> srcs/.env; \
	echo db_pwd=tt >> srcs/.env; \
	echo SQL_ROOT_PASSWORD=1234 >> srcs/.env; \
	echo ftp_user=daje >> srcs/.env; \
	echo ftp_pwd=roma >> srcs/.env; \
	echo USERDOCKER=${USER} >> srcs/.env; \
	fi
	@if [ ! -d /home/${USER}/data ]; then \
	mkdir /home/${USER}/data; \
	mkdir /home/${USER}/data/wordpress; \
	mkdir /home/${USER}/data/mariadb; \
	mkdir /home/${USER}/data/adminer; \
	mkdir /home/${USER}/data/website; \
	fi
	@if [ ! -d /home/${USER}/data/wordpress ]; then \
	mkdir /home/${USER}/data/wordpress; \
	fi
	@if [ ! -d /home/${USER}/data/mariadb ]; then \
	mkdir /home/${USER}/data/mariadb; \
	fi
	@if [ ! -d /home/${USER}/data/adminer ]; then \
	mkdir /home/${USER}/data/adminer; \
	fi
	@if [ ! -d /home/${USER}/data/website ]; then \
	mkdir /home/${USER}/data/website; \
	fi
	@sudo docker-compose -f srcs/docker-compose.yml up -d --build

down:
	@sudo docker-compose -f srcs/docker-compose.yml down -v --rmi all

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
	@echo "\nlogs of adminer\n--------------------------------------------\n"
	@sudo docker logs adminer
	@echo "\nlogs of redis\n--------------------------------------------\n"
	@sudo docker logs redis
	@echo "\nlogs of ftp\n--------------------------------------------\n"
	@sudo docker logs ftp
	@echo "\nlogs of cadvisor\n--------------------------------------------\n"
	@sudo docker logs cadvisor
	@echo "\nlogs of website\n--------------------------------------------\n"
	@sudo docker logs website

ipaddress:
	sudo docker inspect ftp | grep IPAddress
