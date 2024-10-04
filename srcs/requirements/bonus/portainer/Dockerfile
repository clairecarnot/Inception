FROM debian:bullseye

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y wget tar apache2-utils ca-certificates

RUN wget https://github.com/portainer/portainer/releases/download/2.19.5/portainer-2.19.5-linux-amd64.tar.gz \
	&& tar xvzf /portainer-2.19.5-linux-amd64.tar.gz  -C /usr/local/bin/ \
	&& rm -rf portainer-2.19.5-linux-amd64.tar.gz

RUN chmod +x /usr/local/bin/portainer/portainer

EXPOSE 9000

CMD ["/usr/local/bin/portainer/portainer"]
