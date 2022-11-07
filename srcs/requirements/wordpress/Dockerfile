FROM debian:buster

RUN apt-get update && apt-get install -y php-mysql php-fpm mariadb-client wget unzip curl sendmail

RUN mkdir -p /var/www/html
WORKDIR /var/www/

RUN wget https://wordpress.org/latest.zip
RUN unzip /var/www/latest.zip
RUN rm -f /var/www/latest.zip
RUN chown -R www-data:www-data /var/www/
RUN mkdir -p /run/php
RUN chown www-data:www-data /run/php
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli

COPY --chown=www-data:www-data conf/wordpress-entrypoint_backup.sh /var/www/wordpress/wordpress-entrypoint_backup.sh
RUN chmod +x /var/www/wordpress/wordpress-entrypoint_backup.sh
COPY --chown=www-data:www-data conf/www.conf /etc/php/7.3/fpm/pool.d

EXPOSE 9000

WORKDIR /var/www/wordpress

ENTRYPOINT ["/bin/bash", "/var/www/wordpress/wordpress-entrypoint_backup.sh"] 

CMD ["/usr/sbin/php-fpm7.3", "-F"]