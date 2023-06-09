#!/bin/bash
# Узнаем цвет контейнера backend и останавливаем другой цвет
BACKEND_BLUE="false"
BACKEND_GREEN="false"
docker ps | grep -q blue && BACKEND_BLUE="true"
docker ps | grep -q green && BACKEND_GREEN="true"
# Первичный запуск
if [ "$BACKEND_BLUE" == "false" ] && [ "$BACKEND_GREEN" == "false" ]; then
  docker-compose up -d --force-recreate backend-blue
fi
# Если запущен синий backend, то скачиваем обновление и перезапускаем зеленый
if [ "$BACKEND_BLUE" == "true" ]; then
  docker-compose pull backend-green
  docker-compose up -d --force-recreate backend-green
  until docker container ls --filter health=healthy | grep -q "green"; do sleep 1; done
  docker-compose stop backend-blue
elif [ "$BACKEND_GREEN" == "true" ]; then
  docker-compose pull backend-blue
  docker-compose up -d --force-recreate backend-blue
  until docker container ls --filter health=healthy | grep -q "blue"; do sleep 1; done
  docker-compose stop backend-green
fi
