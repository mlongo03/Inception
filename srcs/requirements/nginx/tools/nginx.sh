#!/bin/bash

openssl req -x509 -nodes -out $CERTS_ -keyout $KEYS_ -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=$DOMAIN_NAME/UID=mlongo"

# l'espansione aggiunge /
sed -i -r "s#first#$CERTS_#g"    /etc/nginx/nginx.conf

sed -i -r "s#second#$KEYS_#g"    /etc/nginx/nginx.conf

sed -i -r "s#third#$DOMAIN_NAME#g"    /etc/nginx/nginx.conf


chmod 755 /var/www/wordpress/
chown -R www-data:www-data /var/www/wordpress/

chmod 755 /var/www/adminer/
chown -R www-data:www-data /var/www/adminer/

nginx -g "daemon off;"
