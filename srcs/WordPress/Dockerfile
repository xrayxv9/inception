FROM debian:bullseye

#change le directory dans lequel les commandes s'executes

WORKDIR /var/www/html


COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x "/entrypoint.sh"
RUN apt update
RUN apt install wget sudo -y
RUN apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg
RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz && \
    rm wordpress.tar.gz && \
    mv wordpress/* . && \
    rmdir wordpress
COPY ./config.php wp-config.php
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
RUN mkdir -p /var/www ; chmod -R 777 /var/www
RUN apt update -y
RUN apt -y install php8.3 php8.3-common php8.3-cli php8.3-gd php8.3-mysql php8.3-mbstring php8.3-bcmath php8.3-xml php8.3-fpm php8.3-curl php8.3-zip
RUN mkdir -p /run/php/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /home/www
RUN useradd www

EXPOSE 9000

ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["php-fpm8.3", "-F"]

