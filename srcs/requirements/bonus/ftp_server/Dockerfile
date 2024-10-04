FROM debian:bullseye

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y vsftpd

EXPOSE 20-21

COPY conf/vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /var/www/ccarnot \
	&& chmod 755 /var/www/ccarnot

COPY tools/vsftpd.sh /tmp/vsftpd.sh
RUN chmod +x /tmp/vsftpd.sh

ENTRYPOINT [ "sh", "/tmp/vsftpd.sh" ]
