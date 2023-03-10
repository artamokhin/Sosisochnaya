#!/bin/bash
# Узнаем цвет контейнера бэка и останавливаем другой цвет
COLOR="none"
docker ps | grep -q blue && COLOR=blue
docker ps | grep -q green && COLOR=green
"$COLOR"=="blue" && docker-compose pull && docker-compose up -d --no-deps --force-recreate backend-green