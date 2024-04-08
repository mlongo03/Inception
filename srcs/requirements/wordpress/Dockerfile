FROM debian:bullseye

RUN apt update \
 && apt upgrade -y \
 && apt install vim -y \
 && apt install curl -y \
 && apt-get -y install wget \
 && apt-get install -y php7.4 \
 php-fpm \
 php-mysql \
 mariadb-client \
 && wget https://wordpress.org/wordpress-6.5.tar.gz -P /var/www \
 && cd /var/www/ && tar -xzf wordpress-6.5.tar.gz && rm /var/www/wordpress-6.5.tar.gz \
 && chown -R root:root /var/www/wordpress \
 && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
 && chmod +x wp-cli.phar \
 && mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD [ "php-fpm7.4", "-F" ]
