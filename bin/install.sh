#!/bin/bash

APP_CONTAINER=$APP_CONTAINER DB_CONTAINER=$DB_CONTAINER ./$RUN_SCRIPT

./$CREATE_PROJECT_SCRIPT

if [ $? -eq 0 ]; then
    echo "Magento project created successfully."
else
    echo "Composer create-project failed!"
    exit 1
fi

DB_CONTAINER=$DB_CONTAINER ./$SETUP_DB_SCRIPT

APP_CONTAINER=$APP_CONTAINER ./$SETUP_MAGENTO_SCRIPT

if [ $? -eq 0 ]; then
    echo "Magento setup completed successfully."
    echo "You may now access your Magento instance at https://ari.local:8080/"

    # echo "You may now access your Magento backend instance at https://${DOMAIN}/admin/"

    # echo "Use the following default credentials to log in:"
    # echo "Username: $MAGENTO_ADMIN_USER"
    # echo "Password: $MAGENTO_ADMIN_PASSWORD"
else
    echo "Magento setup installation failed!"
    exit 1
fi
