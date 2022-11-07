FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

COPY conf/my.cnf /etc/mysql/my.cnf
COPY conf/init.sql /tmp/init.sql

EXPOSE 3306

CMD ["mysqld", "--user=mysql", "--init-file=/tmp/init.sql"]