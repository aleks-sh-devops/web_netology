#!/bin/bash

#Запускаем собранный контейнер + пробрасываем тома:
docker container run -d \
 -p 80:80 \
 -v ${PWD}/nginx/html:/usr/share/nginx/html \
 --restart on-failure \
 aleksshdevops/web_netology:0.0.1

docker container ps -a
sleep 3
echo '++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
docker container ps -a
