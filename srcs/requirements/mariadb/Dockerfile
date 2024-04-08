FROM debian:bullseye

RUN apt update \
 && apt upgrade -y \
 && apt-get install mariadb-server -y \
 && apt install vim -y \
 && apt install curl -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/mariadb.sh	/etc/mysql/mariadb.sh

CMD [ "/etc/mariadb/mariadb.sh" ]
