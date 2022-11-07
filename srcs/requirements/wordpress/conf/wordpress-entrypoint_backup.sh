#!/bin/bash

cd /var/www/wordpress
# wp-cli --allow-root core download
wp-cli --allow-root core config \
		--dbhost=mariadb \
		--dbname=wordpress \
		--dbuser=wordpress \
		--dbpass=secret \
		--locale=en_US \
		--skip-check

# chown www-data:www-data wp-config.php

wp-cli --allow-root core install \
		--url="jtomala.42.fr" \
		--title="Inception Demo Page" \
		--admin_user=jtomala \
		--admin_password=jtomala \
		--admin_email="jtomala@student.42wolfsburg.de"

wp-cli --allow-root option update siteurl "https://jtomala.42.fr"
wp-cli --allow-root rewrite structure '/%year%/%monthnum%/%day%/%postname%/'
wp-cli --allow-root user create student student@example.com --role=contributor --user_pass=student

exec "$@"