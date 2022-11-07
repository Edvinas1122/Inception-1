FROM debian:buster

RUN apt-get update && apt-get install nginx -y

COPY conf/nginx.conf /etc/nginx/sites-available/default
COPY conf/certs /etc/nginx/certs/self-signed

CMD	["nginx", "-g", "daemon off;"]