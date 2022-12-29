#! /bin/bash
#Если свалится одна из команд, рухнет и весь скрипт
set -xe
#Перезаливаем дескриптор сервиса на ВМ для деплоя
sudo cp -rf sausage-store-frontend.service /etc/systemd/system/sausage-store-frontend.service
sudo systemctl stop sausage-store-frontend
sudo rm -rf /var/www-data/dist/frontend||true
#Переносим артефакт в нужную папку
curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o sausage-store-${VERSION}.tar.gz ${NEXUS_REPO_URL_FRONTEND}/com/yandex/practicum/devops/sausage-store/${VERSION}/sausage-store-${VERSION}.tar.gz
sudo cp ./sausage-store-${VERSION}.tar.gz /var/www-data/dist/sausage-store-${VERSION}.tar.gz||true #"<...>||true" говорит, если команда обвалится — продолжай#Обновляем конфиг systemd с помощью рестарта
sudo tar xzvf sausage-store-${VERSION}.tar.gz
sudo systemctl daemon-reload
#Перезапускаем сервис сосисочной
sudo systemctl restart sausage-store-frontend 