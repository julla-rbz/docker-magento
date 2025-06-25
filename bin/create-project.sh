#!/bin/bash

echo "Running composer create-project inside the container..."

CONFIG_FILE="./config/auth.json"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "Error: Configuration file $CONFIG_FILE not found. Please create it with the necessary credentials."
  exit 1
fi

MAGENTO_USERNAME=$(grep -o '"username": *"[^"]*"' $CONFIG_FILE | sed 's/"username": *"\([^"]*\)"/\1/')
MAGENTO_PASSWORD=$(grep -o '"password": *"[^"]*"' $CONFIG_FILE | sed 's/"password": *"\([^"]*\)"/\1/')
MAGENTO_AUTH_PROP="http-basic.repo.magento.com"

if [ -z "$MAGENTO_USERNAME" ] || [ -z "$MAGENTO_PASSWORD" ]; then
  echo "Error: Magento username or password is not set. Please provide the correct credentials in the config file."
  exit 1
fi

# if [ -d "./src" ]; then
#   echo "Error: The 'src' directory is not empty. Please remove all contents within this directory and try again."
#   exit 1
# fi

docker exec -it $APP_CONTAINER bash -c "cd /var/www/html &&
composer config -g $MAGENTO_AUTH_PROP $MAGENTO_USERNAME $MAGENTO_PASSWORD &&
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=2.4.8 . "
