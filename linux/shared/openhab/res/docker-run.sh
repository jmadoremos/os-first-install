#!/bin/bash

# Define variables
CONTAINER_NAME="openhab"
INSTALL_DIR="/home/$(id -u -n)/openhab"
OPENHAB_USER="openhab"
TIMEOUT=20
echo "[] Running in directory: $INSTALL_DIR"

# Stop and remove existing container
echo "[] Removing \"$CONTAINER_NAME\" container if exists..."
if [ ! "$(sudo docker ps -q -f name=$CONTAINER_NAME)" ]; then
    if [ "$(sudo docker ps -aq -f status=exited -f name=$CONTAINER_NAME)" ]; then
        sudo docker rm $CONTAINER_NAME
    fi
fi

# Run image as container
docker run -d \
    --name $CONTAINER_NAME \
    -e USER_ID=$(id -u $OPENHAB_USER) \
    -e GROUP_ID=$(id -g $OPENHAB_USER) \
    -v "${INSTALL_DIR}/etc/localtime:/etc/localtime:ro" \
    -v "${INSTALL_DIR}/etc/timezone:/etc/timezone:ro" \
    -v "${INSTALL_DIR}/conf:/openhab/conf" \
    -v "${INSTALL_DIR}/userdata:/openhab/userdata" \
    -v "${INSTALL_DIR}/addons:/openhab/addons" \
    --net=host \
    --restart=unless-stopped \
    openhab/openhab:latest

printf "Starting $CONTAINER_NAME container "
for i in $(seq 1 $TIMEOUT); do
    if [ "$(sudo docker inspect -f "{{.State.Health.Status}}" $CONTAINER_NAME)" == "healthy" ] ; then
        printf ' OK'
        exit 0
    else
        sleep 3
        printf '.'
    fi

    if [ $i -eq $TIMEOUT ] ; then
        echo -e "\nTimed out waiting for container to start, consult the container logs for more info (\`sudo docker logs $CONTAINER_NAME\`)"
        exit 1
    fi
done;
