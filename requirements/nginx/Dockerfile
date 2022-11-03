FROM debian:buster

RUN apt-get update && apt-get install nginx -y

ADD nginx.conf /etc/nginx/conf.d/nginx.conf
COPY certs /etc/nginx/certs/self-signed


CMD	["nginx", "-g", "daemon off;"]