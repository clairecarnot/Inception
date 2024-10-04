#!/bin/bash

if [ -d "/var/lib/mysql/wordpress" ]
then
	echo "Database already exists"
else
	service mariadb start;

	sleep 5

	mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

	mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

	mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';"

	mysql -e "FLUSH PRIVILEGES;"

	mysqladmin -u root --password=${SQL_ROOT_PASSWORD} shutdown

	sleep 5
fi

exec mysqld -u root
