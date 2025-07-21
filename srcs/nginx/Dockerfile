FROM debian:bullseye

RUN apt update
RUN apt install nginx -y

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
