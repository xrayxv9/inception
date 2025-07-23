#!/bin/bash

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

echo "Hello theree"

service mariadb start
mariadb << here
CREATE DATABASE $WORDPRESS_DB_NAME;
CREATE USER "$WORDPRESS_DB_USER"@"%" IDENTIFIED BY "$WORDPRESS_DB_PASSWORD";
GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO "$WORDPRESS_DB_USER"@"%";
FLUSH PRIVILEGES;
here
service mariadb stop
sed -i "s|skip-networking|# skip-networking|g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf
exec $@
