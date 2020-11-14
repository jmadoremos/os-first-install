#!/bin/bash

# https://github.com/pi-hole/docker-pi-hole/blob/master/README.md

# Define variables
CONTAINER_NAME="pihole"
INSTALL_DIR="/home/$(id -u -n)/pi-hole"
TIMEZONE="Asia/Manila"
echo "[] Running in directory: $INSTALL_DIR"

# Stop and remove existing container
echo "[] Removing \"$CONTAINER_NAME\" container if exists..."
if [ ! "$(sudo docker ps -q -f name=$CONTAINER_NAME)" ]; then
    if [ "$(sudo docker ps -aq -f status=exited -f name=$CONTAINER_NAME)" ]; then
        sudo docker rm $CONTAINER_NAME
    fi
fi

# Run image as container
sudo docker run -d \
    --name $CONTAINER_NAME \
    -p 53:53/tcp \
    -p 53:53/udp \
    -p 80:80 \
    -p 443:443 \
    -e TZ="${TIMEZONE}" \
    -v "${INSTALL_DIR}/etc/pihole/:/etc/pihole/" \
    -v "${INSTALL_DIR}/etc/dnsmasq.d/:/etc/dnsmasq.d/" \
    --dns=127.0.0.1 \
    --dns=1.1.1.1 \
    --restart=unless-stopped \
    --hostname pi.hole \
    -e VIRTUAL_HOST="pi.hole" \
    -e PROXY_LOCATION="pi.hole" \
    -e ServerIP="127.0.0.1" \
    pihole/pihole:latest

printf "Starting $CONTAINER_NAME container "
for i in $(seq 1 20); do
    if [ "$(sudo docker inspect -f "{{.State.Health.Status}}" $CONTAINER_NAME)" == "healthy" ] ; then
        printf ' OK'
        echo -e "\n$(sudo docker logs $CONTAINER_NAME 2> /dev/null | grep 'password:') for your pi-hole: https://${IP}/admin/"
        exit 0
    else
        sleep 3
        printf '.'
    fi

    if [ $i -eq 20 ] ; then
        echo -e "\nTimed out waiting for container to start, consult the container logs for more info (\`sudo docker logs $CONTAINER_NAME\`)"
        exit 1
    fi
done;
