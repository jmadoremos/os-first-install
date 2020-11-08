#!/bin/bash

# Run pihole container
if [ ! "$(sudo docker ps -q -f name=pihole)" ]; then
    if [ "$(sudo docker ps -aq -f status=exited -f name=pihole)" ]; then
        sudo docker rm pihole
    fi
    sudo docker-compose up --detach
fi

# Retrieve random password
printf 'Starting pihole container '
for i in $(seq 1 20); do
    if [ "$(sudo docker inspect -f "{{.State.Health.Status}}" pihole)" == "healthy" ] ; then
        printf ' OK'
        echo -e "\n$(sudo docker logs pihole 2> /dev/null | grep 'password:') for your pi-hole: https://${IP}/admin/"
        exit 0
    else
        sleep 3
        printf '.'
    fi

    if [ $i -eq 20 ] ; then
        echo -e "\nTimed out waiting for Pi-hole start, consult check your container logs for more info (\`sudo docker logs pihole\`)"
        exit 1
    fi
done;
