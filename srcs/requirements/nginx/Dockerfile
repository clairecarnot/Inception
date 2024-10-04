# base image
FROM debian:bullseye

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y nginx openssl vim curl

RUN mkdir -p /etc/nginx/ssl

# generate self-signed certificate + key
RUN openssl req -x509 -nodes -keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ccarnot.42.fr/UID=ccarnot@student.42.fr"

# listen port (443 is default port for https traffic)
EXPOSE 443

# copy our config file to the container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# create directory for Web content and gives its ownership to default user/group that Nginx run as
RUN mkdir /var/www/ccarnot && chmod 755 /var/www/ccarnot
RUN chown -R www-data:www-data /var/www/ccarnot

# cmd at the start of the container : run in the foreground (=/= background, as daemons)
CMD [ "nginx", "-g", "daemon off;" ]
