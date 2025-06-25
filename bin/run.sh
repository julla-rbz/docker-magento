#!/bin/bash

echo "Running docker-compose up -d..."
docker-compose up -d

until [ "$(docker inspect -f '{{.State.Running}}' $APP_CONTAINER)" == "true" ]; do
    echo "Waiting for Magento app container to be up..."
    sleep 2
done

echo "Magento app container is up and running."
