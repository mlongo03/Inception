FROM debian:bullseye

RUN apt update \
 && apt upgrade -y \
 && apt install vim -y \
 && apt install curl -y \
 && apt-get -y install wget \
 && apt-get install -y php7.4 \
 php-fpm \
 php-mysql \
 mariadb-client

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /var/www/adminer \
 && wget -P var/www/adminer https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

RUN mkdir /run/php

CMD ["/usr/sbin/php-fpm7.4", "-F"]
