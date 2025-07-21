FROM debian:bullseye

RUN mkdir -p /run/mysqld/
RUN mkdir -p /var/lib/mysql/
RUN chmod 777 /run/mysqld
RUN curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash
RUN apt update -y
RUN apt install mariadb-server -y

# copy depuis mon environnement dans le docker
COPY entrypoint.sh entrypoint.sh
RUN chmod +x "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]

CMD ["mariadbd"]
