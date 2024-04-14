#!/bin/bash

sleep 20

cd /var/www/

wp core download --version=6.5 --allow-root

wp config create	--allow-root \
					--dbname=$db_name \
					--dbuser=$db_user \
					--dbpass=$db_pwd \
					--dbhost=mariadb:3306 --path='/var/www'

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

mkdir /run/php

/usr/sbin/php-fpm7.4 -F
