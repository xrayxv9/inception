#!bin/bash


sudo -u www -i -- wp core install --url="http://cmorel.42.fr" --title="Joy" --admin_user="xray" --admin_password="xray" --admin_email="xrayxv.5@gmail.com" --locale=en_US --path /var/www/html
sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php/8.3/fpm/pool.d/www.conf

exec $@
