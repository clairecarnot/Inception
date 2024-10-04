#!/bin/bash

if [ ! -f /data/htpasswd ]; then
    htpasswd -cb /data/htpasswd admin $PORTAINER_PASSWORD
fi

exec /usr/local/bin/portainer/portainer --admin-password "$PORTAINER_PASSWORD"
