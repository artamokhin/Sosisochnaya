#!/bin/bash
MONGO_DB="mongodb:\/\/artamokhin1:***REMOVED***@rc1a-ftsq82uol4t7mcoq.mdb.yandexcloud.net:27018\/artamokhin1?tls=true&tlsAllowInvalidCertificates=true"
echo $MONGO_DB
docker-compose up -d report