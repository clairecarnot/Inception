#!/bin/sh

if [ -e "/var/www/ccarnot/wordpress/wp-config.php" ]
then
	echo "wordpress already downloaded"
else

# --------------- MANDATORY --------------- #

	# download WP-CLI (WordPress Command Line Interface)
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	wp core download --allow-root --path=/var/www/ccarnot/wordpress

	sleep 10

	cd /var/www/ccarnot/wordpress
	
	wp config create --allow-root \
		--dbname=${SQL_DATABASE} \
		--dbuser=${SQL_USER} \
		--dbpass=${SQL_PASSWORD} \
		--dbhost=mariadb ;

	wp core install --allow-root \
		--url=https://${DOMAIN_NAME} \
		--title=${SITE_TITLE} \
		--admin_user=${ADMIN_USER} \
		--admin_password=${ADMIN_PASSWORD} \
		--admin_email=${ADMIN_EMAIL} ;

	wp user create --allow-root \
		${USER1_LOGIN} ${USER1_MAIL} \
		--user_pass=${USER1_PASSWORD} \
		--role=author ;

# --------------- BONUS --------------- #

# redis #

	wp config set WP_REDIS_HOST redis --allow-root
  	wp config set WP_REDIS_PORT 6379 --raw --allow-root
 	wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
 	wp config set WP_REDIS_CLIENT phpredis --allow-root
	wp plugin install redis-cache --activate --allow-root
	wp plugin update --all --allow-root
	wp redis enable --allow-root

fi

exec /usr/sbin/php-fpm7.4 -F
