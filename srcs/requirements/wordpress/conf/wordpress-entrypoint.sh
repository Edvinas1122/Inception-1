#!/bin/bash

cd /var/www/wordpress
wp-cli --allow-root core config \
		--dbhost=${WORDPRESS_DB_HOST} \
		--dbname=${WORDPRESS_DB_NAME} \
		--dbuser=${WORDPRESS_DB_USER} \
		--dbpass=${WORDPRESS_DB_PASSWORD} \
		--locale=en_US \
		--skip-check

wp-cli --allow-root core install \
		--url=${WORDPRESS_WEBSITE_URL_WITHOUT_HTTP} \
		--title=${WORDPRESS_WEBSITE_TITLE} \
		--admin_user=${WORDPRESS_ADMIN_USER} \
		--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
		--admin_email=${WORDPRESS_ADMIN_EMAIL}

wp-cli --allow-root option update siteurl ${WORDPRESS_WEBSITE_URL}
wp-cli --allow-root rewrite structure '/%year%/%monthnum%/%day%/%postname%/'
wp-cli --allow-root user create $(WORDPRESS_OTHER_USER) ${WORDPRESS_OTHER_USER_EMAIL} --role=contributor --user_pass=${WORDPRESS_OTHER_USER_PASSWORD}

exec "$@"