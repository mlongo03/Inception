#!/bin/bash

mkdir -p /var/www/website/assets
mkdir -p /var/www/website/contact_me

mv /index.html /var/www/website
mv /contact.html /var/www/website
mv /favicon.ico /var/www/website
mv /assets/* /var/www/website/assets
mv /contact_me/* /var/www/website/contact_me

tail -f /dev/null
