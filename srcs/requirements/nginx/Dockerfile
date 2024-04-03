# FROM debian:buster
FROM debian:bullseye

RUN apt update \
 && apt install nginx -y \
 && apt install vim -y \
 && apt install curl -y \
 && mkdir -p/etc/Nginx/ssl \
 && apt install OpenSSL -y \
 && openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

COPY conf/nginx.conf /etc/nginx/nginx.conf
