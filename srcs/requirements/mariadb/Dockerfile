FROM debian:bullseye

RUN apt update \
 && apt upgrade -y \
 && apt-get install mariadb-server -y \
 && mkdir /run/mysqld \
 && chown -R mysql:mysql /run/mysqld \
 && apt install vim -y \
 && apt install curl -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mariadb.sh	/

RUN chmod +x /mariadb.sh

CMD [ "/mariadb.sh" ]
