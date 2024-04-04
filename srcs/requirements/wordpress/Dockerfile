FROM debian:bullseye

RUN apt update \
 && apt upgrade -y \
 && apt install vim -y \
 && apt install curl -y \
 && apt-get -y install wget \
 && apt-get install -y php7.3 \
 php-fpm \
 php-mysql \
 mariadb-client \
 && wget https://wordpress.org/wordpress-6.5.tar.gz -P /var/www \
 && cd /var/www/ && tar -xzf wordpress-6.5.tar.gz && rm /var/www/wordpress-6.5.tar.gz \
 && chown -R root:root /var/www/wordpress


# RUN apt update
# RUN apt upgrade -y
# RUN apt install vim -y
# RUN apt install curl -y
# RUN apt-get -y install wget
# RUN apt-get install -y php7.3 \
# php-fpm \
# php-mysql \
# mariadb-client
# RUN wget https://wordpress.org/wordpress-6.5.tar.gz -P /var/www
# RUN cd /var/www/ && tar -xzf wordpress-6.5.tar.gz && rm /var/www/wordpress-6.5.tar.gz
# RUN chown -R root:root /var/www/wordpress
