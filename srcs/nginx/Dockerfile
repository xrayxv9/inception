FROM debian:bullseye

RUN apt update
RUN apt install nginx openssl -y
RUN mkdir -p /etc/nginx/certs/
COPY ./cmorel.42.fr.conf /etc/nginx/sites-enabled/cmorel.42.fr.conf

EXPOSE 443

RUN openssl req -x509\
	-nodes -days 365 \
	-newkey rsa:2048 \
	-keyout /etc/nginx/certs/nginx.key \
	-out /etc/nginx/certs/nginx.crt \
        -subj "/CN=$DOMAIN"

CMD ["nginx", "-g", "daemon off;"]
