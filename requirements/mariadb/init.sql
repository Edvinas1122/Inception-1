USE mysql;
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'wordpress'@'%' IDENTIFIED BY 'secret';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'wordpress';

-- How to access the database:
-- docker exec -it mariadb /bin/bash
-- mysql; (will not work)
-- mysql -u wordpress -psecret;
-- show database;
-- use wordpress;
-- show tables;
-- exit;