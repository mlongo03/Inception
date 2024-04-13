#!/bin/bash

openssl req -x509 -nodes -out $CERTS_ -keyout $KEYS_ -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

# l'espansione aggiunge /
sed -i -r "s/first/$CERTS_2/g"    /etc/nginx/nginx.conf

sed -i -r "s/second/$KEYS_2/g"    /etc/nginx/nginx.conf

sed -i -r "s/third/$DOMAIN_NAME/g"    /etc/nginx/nginx.conf

nginx -g "daemon off;"
