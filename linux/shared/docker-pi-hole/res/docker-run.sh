#!/bin/bash

# Define variables
CONTAINER_NAME="pihole"
INSTALL_DIR="/home/$(id -u -n)/pi-hole"
TIMEOUT=20
TIMEZONE="Asia/Manila"
echo "[] Running in directory: $INSTALL_DIR"

# Stop and remove existing container
echo "[] Removing \"$CONTAINER_NAME\" container if exists..."
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    docker stop $CONTAINER_NAME &> /dev/null
    if [ "$(docker ps -aq -f status=exited -f name=$CONTAINER_NAME)" ]; then
        docker rm $CONTAINER_NAME &> /dev/null
    fi
fi

# Run image as container
echo "[] Starting \"$CONTAINER_NAME\" container..."
docker run -d \
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

echo -n "[] Checking status"
for i in $(seq 1 $TIMEOUT); do
    if [ "$(docker inspect -f "{{.State.Health.Status}}" $CONTAINER_NAME)" == "healthy" ] ; then
        echo " OK"
        echo "$(docker logs $CONTAINER_NAME 2> /dev/null | grep 'password:') for your pi-hole."
        exit 0
    else
        sleep 3
        echo -n "."
    fi

    if [ $i -eq $TIMEOUT ] ; then
        echo -e "\nTimed out waiting for container to start, consult the container logs for more info (\`docker logs $CONTAINER_NAME\`)"
        exit 1
    fi
done;
