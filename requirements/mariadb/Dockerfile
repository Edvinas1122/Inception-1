FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

#RUN chown -R mysql /etc/mysql/datadir
COPY my.cnf /etc/mysql/my.cnf
COPY init.sql /tmp/init.sql

EXPOSE 3306

CMD ["mysqld", " --user=mysql", "--init-file=/tmp/init.sql"]