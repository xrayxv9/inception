#!bin/bash


wp core install --url="http://cmorel.42.fr" --title="Joy" --admin_user="WORDPRESS_USER" --admin_password="WORDPRESS_PASS" --admin_email="WORDPRESS_MAIL" --locale=en_US
exec $@

