USE mysql;
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'wordpress'@'%' IDENTIFIED BY 'secret';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'wordpress';

-- for command help: http://g2pc1.bu.edu/~qzpeng/manual/MySQL%20Commands.htm
-- for login: 
-- docker exec -it mariadb bash
-- mysql; (will not work)
-- mysql -u wordpress -psecret;
-- show databases;
-- use wordpress;
-- show tables;
-- exit;