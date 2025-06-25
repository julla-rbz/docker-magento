#!/bin/bash

echo "Running Magento setup:install..."

docker exec -it $APP_CONTAINER bash -c "cd /var/www/html && 
    bin/magento setup:install \
    --base-url=http://ari.local:8080 \
    --db-host=db \
    --db-name=magento \
    --db-user=magento_user \
    --db-password=magento_password \
    --admin-firstname=admin \
    --admin-lastname=admin \
    --admin-email=admin@admin.com \
    --admin-user=admin \
    --admin-password=admin123 \
    --language=th_TH \
    --currency=THB \
    --timezone=Asia/Bangkok \
    --use-rewrites=1 \
    --search-engine=opensearch \
    --opensearch-host=opensearch \
    --opensearch-port=9200 \
    --opensearch-index-prefix=magento2 \
    --opensearch-timeout=15 \
    --cache-backend=redis \
    --cache-backend-redis-server=valkey \
    --cache-backend-redis-port=6379 \
    --cache-backend-redis-db=0 \
    --session-save=redis \
    --session-save-redis-host=valkey \
    --session-save-redis-port=6379 \
    --session-save-redis-db=2 \
    --session-save-redis-password= \
    "
