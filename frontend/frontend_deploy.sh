#!/bin/bash
docker pull std-012-056 std-012-056/sausage-store/sausage-frontend:latest
docker stop sausage-frontend || true
docker rm sausage-frontend || true
set -e
docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
docker run -d --name sausage-frontend \
    --network=sausage_network \
    --restart always \
    --pull always \
    --env-file .env \
    gitlab.praktikum-services.ru:5050/std-012-056/sausage-store/sausage-frontend:latest 