FROM debian:bullseye

# php7.4-mysql allows to communicate with a msq/mariadb server
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y php7.4 php7.4-mysql wget \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html \
	&& chmod 777 /var/www/html

WORKDIR /var/www/html

RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" \
    && mv adminer-4.8.1.php index.php

EXPOSE 8080

# adminer will read mariadb when we connect via http://localhost:8080
ENTRYPOINT ["php7.4", "-S", "0.0.0.0:8080"]
