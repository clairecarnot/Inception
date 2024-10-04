#!/bin/sh


if [ ! -f "/etc/vsftpd_config" ]; then

    useradd -m $FTP_USR && echo "$FTP_USR:$FTP_PASSWORD" | chpasswd
    chown -R $FTP_USR:$FTP_USR /var/www/ccarnot

    mkdir -p /var/run/vsftpd/empty

    touch /etc/vsftpd_config

fi

exec /usr/sbin/vsftpd /etc/vsftpd.conf
