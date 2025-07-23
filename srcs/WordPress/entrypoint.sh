#!bin/bash

sleep 10
sudo -u www -i -- wp core install \
  --url="http://$DOMAIN" \
  --title="sad" \
  --admin_user="$WORDPRESS_USER" \
  --admin_password="$WORDPRESS_PASSWORD" \
  --admin_email="$WORDPRESS_MAIL" \
  --locale=en_US \
  --path=/var/www/html

sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php/8.3/fpm/pool.d/www.conf



exec $@
