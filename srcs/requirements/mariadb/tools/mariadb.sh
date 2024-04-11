#!/bin/bash

mysqld &

sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS \`${db_name}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${db_user}\`@'localhost' IDENTIFIED BY '${db_pwd}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${db_name}\`.* TO \`${db_user}\`@'%' IDENTIFIED BY '${db_pwd}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe
