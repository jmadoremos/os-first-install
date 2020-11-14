#!/bin/bash

# Define variables
CONTAINER_NAME="openhab"
INSTALL_DIR="/home/$(id -u -n)/openhab"
OPENHAB_USER="openhab"
TIMEOUT=20
echo "[] Running in directory: $INSTALL_DIR"

# Stop and remove existing container
echo "[] Removing \"$CONTAINER_NAME\" container if exists..."
if [ "$(sudo docker ps -q -f name=$CONTAINER_NAME)" ]; then
    sudo docker stop $CONTAINER_NAME &> /dev/null
    if [ "$(sudo docker ps -aq -f status=exited -f name=$CONTAINER_NAME)" ]; then
        sudo docker rm $CONTAINER_NAME &> /dev/null
    fi
fi

# Run image as container
echo "[] Starting \"$CONTAINER_NAME\" container..."
sudo docker run -d \
    --name $CONTAINER_NAME \
    -e USER_ID=$(id -u $OPENHAB_USER) \
    -e GROUP_ID=$(id -g $OPENHAB_USER) \
    -v "/etc/localtime:/etc/localtime:ro" \
    -v "${INSTALL_DIR}/conf:/openhab/conf" \
    -v "${INSTALL_DIR}/userdata:/openhab/userdata" \
    -v "${INSTALL_DIR}/addons:/openhab/addons" \
    --net=host \
    --restart=unless-stopped \
    openhab/openhab:latest

echo -n "[] Checking status"
for i in $(seq 1 $TIMEOUT); do
    if [ "$(sudo docker inspect -f "{{.State.Status}}" $CONTAINER_NAME)" == "running" ] ; then
        echo " running."
        exit 0
    else
        sleep 3
        echo -n "."
    fi

    if [ $i -eq $TIMEOUT ] ; then
        echo "** timed out **"
        echo -e "Consult the container logs for more info (\`sudo docker logs $CONTAINER_NAME\`)"
        exit 1
    fi
done;
