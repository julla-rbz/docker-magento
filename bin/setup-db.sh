#!/bin/bash

echo "Setting log_bin_trust_function_creators inside MySQL..."

docker exec -it $DB_CONTAINER mysql -u root -p"r00tP@ssw0rd" -e "SET GLOBAL log_bin_trust_function_creators = 1;"

if [ $? -eq 0 ]; then
    echo "log_bin_trust_function_creators set successfully."
else
    echo "Failed to set log_bin_trust_function_creators!"
    exit 1
fi

echo "Creating Magento database..."

docker exec -it $DB_CONTAINER mysql -u magento_user -p"magento_password" -e "CREATE DATABASE magento;"
