#!/bin/bash

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

echo "Hello theree"

service mariadb start
mariadb << here
CREATE DATABASE wordpress;
CREATE USER "pedro"@"%" IDENTIFIED BY "xray";
GRANT ALL PRIVILEGES ON wordpress.* TO "pedro"@"%";
FLUSH PRIVILEGES;
here
service mariadb stop
exec $@
