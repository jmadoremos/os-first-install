#!/bin/bash

# Define variables
CONTAINER_NAME="openhab"
HTTP_PORT=8080
HTTPS_PORT=8443
INSTALL_DIR="/home/$(id -u -n)/openhab"
OPENHAB_USER="openhab"
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
    -e EXTRA_JAVA_OPTS="-Duser.timezone=$TIMEZONE" \
    -e GROUP_ID=$(id -g $OPENHAB_USER) \
    -e OPENHAB_HTTP_PORT="${HTTP_PORT}" \
    -e OPENHAB_HTTPS_PORT="${HTTPS_PORT}" \
    -e USER_ID=$(id -u $OPENHAB_USER) \
    -v "/etc/localtime:/etc/localtime:ro" \
    -v "${INSTALL_DIR}/conf:/openhab/conf" \
    -v "${INSTALL_DIR}/userdata:/openhab/userdata" \
    -v "${INSTALL_DIR}/addons:/openhab/addons" \
    --net=host \
    --restart=unless-stopped \
    openhab/openhab:latest

echo -n "[] Checking status"
for i in $(seq 1 $TIMEOUT); do
    if [ "$(docker inspect -f "{{.State.Status}}" $CONTAINER_NAME)" == "running" ] ; then
        echo " running."
        exit 0
    else
        sleep 3
        echo -n "."
    fi

    if [ $i -eq $TIMEOUT ] ; then
        echo "** timed out **"
        echo -e "Consult the container logs for more info (\`docker logs $CONTAINER_NAME\`)"
        exit 1
    fi
done;
