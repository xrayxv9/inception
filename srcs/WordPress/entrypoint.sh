#!/bin/bash


if [ ! -f /var/www/html/wp-config.php ]; then
  sudo -u www-data -- wp config create \
    --dbname="$WORDPRESS_DB_NAME" \
    --dbuser="$WORDPRESS_DB_USER" \
    --dbpass="$WORDPRESS_DB_PASSWORD" \
    --dbhost="$WORDPRESS_DB_HOST" \
    --path=/var/www/html \
    --allow-root

  sudo -u www-data -- wp core install \
    --url="http://$DOMAIN" \
    --title="sad" \
    --admin_user="$WORDPRESS_USER" \
    --admin_password="$WORDPRESS_PASSWORD" \
    --admin_email="$WORDPRESS_MAIL" \
    --locale=en_US \
    --path=/var/www/html \
    --skip-email
fi

sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php/8.3/fpm/pool.d/www.conf

exec $@
