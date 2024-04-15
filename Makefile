
all : up

clean : down

re : vclean up

reboot : down up

vclean: down
	@sudo rm -rf /home/manuele/data/wordpress/*
	@sudo rm -rf /home/manuele/data/mariadb/*

up:
	@if [ ! -f srcs/.env ]; then \
	touch srcs/.env ; \
	echo DOMAIN_NAME=mlongo.42.fr >> srcs/.env; \
	echo CERTS_=/etc/nginx/ssl/inception.crt >> srcs/.env; \
	echo CERTS_2=\/etc\/nginx\/ssl\/inception.crt >> srcs/.env; \
	echo KEYS_=/etc/nginx/ssl/inception.key >> srcs/.env; \
	echo KEYS_2=\/etc\/nginx\/ssl\/inception.key >> srcs/.env; \
	echo WP_TITLE=MlongoWP >> srcs/.env; \
	echo WP_ADMIN_USR=mlongo >> srcs/.env; \
	echo WP_ADMIN_PWD=1234 >> srcs/.env; \
	echo WP_ADMIN_EMAIL=manuelelng03@gmail.com >> srcs/.env; \
	echo WP_USR=mlongo2 >> srcs/.env; \
	echo WP_EMAIL=mlongo@student.42roma.it >> srcs/.env; \
	echo WP_PWD=123 >> srcs/.env; \
	echo db_name=maria >> srcs/.env; \
	echo db_user=ss >> srcs/.env; \
	echo db_pwd=tt >> srcs/.env; \
	echo SQL_ROOT_PASSWORD=1234 >> srcs/.env; \
	fi
	@if [! -d /home/$USER/data]; then \
	mkdir /home/$USER/data/wordpress; \
	mkdir /home/$USER/data/mariadb; \
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
