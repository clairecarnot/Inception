FROM debian:bullseye

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# create dir to store runtime data and give ownership to mysql user/group (MariaDB permissions)
RUN mkdir /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY ./tools/mariadb.sh ./
RUN chmod +x ./mariadb.sh

EXPOSE 3306

ENTRYPOINT ["sh", "./mariadb.sh"]
