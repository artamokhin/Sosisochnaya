#! /bin/bash
#Если свалится одна из команд, рухнет и весь скрипт
set -xe
sudo systemctl stop sausage-store-frontend
sudo cp -rf sausage-store-frontend.service /etc/systemd/system/sausage-store-frontend.service
sudo rm -rf /var/www-data/dist/frontend||true
#Переносим артефакт в нужную папку
curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o sausage-store-frontend.tar.gz ${NEXUS_REPO_URL_FRONTEND}/sausage-store-front/sausage-store/${VERSION}/sausage-store-${VERSION}.tar.gz
sudo tar xzvf ./sausage-store-frontend.tar.gz -C /var/www-data/dist/||true #"<...>||true" говорит, если команда обвалится — продолжай#Обновляем конфиг systemd с помощью рестарта
sudo systemctl daemon-reload
#Перезапускаем сервис сосисочной
sudo systemctl restart sausage-store-frontend 