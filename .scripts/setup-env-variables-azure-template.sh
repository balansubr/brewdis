#!/usr/bin/env bash
az
# ==== Resource Group ====
export SUBSCRIPTION=874f6233-e9b0-4c57-a3bc-2365b7544f2a # customize this
export RESOURCE_GROUP=brewredis # customize this
export REGION=westeurope

# ==== First Instance ====
export SPRING_CLOUD_SERVICE=brewredis-spring # customize this
export APP_NAME=storefront


# ==== JARS ====
export BREWDIS_JAR=brewdis-api/build/libs/brewdis-api-1.0.0-SNAPSHOT.jar

# ==== REDIS INFO ====
# export SPRING_REDIS_HOST=redis-server-host # customize this
# export SPRING_REDIS_PASSWORD=redis-password # customize this
export SPRING_REDIS_PORT=10000
export STOMP_HOST=${SPRING_CLOUD_SERVICE}-${APP_NAME}.azuremicroservices.io
#export STOMP_HOST=localhost
export STOMP_PORT=80