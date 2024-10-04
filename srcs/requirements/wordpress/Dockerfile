FROM debian:bullseye

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y php7.4 \
		php-fpm \
		php-mysql \
		mariadb-client \
		curl \
		net-tools \
		redis \
		php-redis

EXPOSE 9000

COPY conf/www.conf /etc/php/7.4/fpm/pool.d

RUN mkdir -p /var/www/ccarnot/wordpress

RUN mkdir /run/php/

COPY tools/wpscript.sh /
RUN chmod +x ./wpscript.sh

RUN chown -R www-data:www-data /var/www/* \
	&& chmod -R 755 /var/www/*

ENTRYPOINT ["sh", "/wpscript.sh"]
