#!/bin/bash

# Создать образ на основании Dockerfile:
docker build ${PWD} \
 -t aleksshdevops/web_netology:0.0.1 \
 -t aleksshdevops/web_netology:latest

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

echo -n "Do you want push the image to Docker Hub? [y/n]?: "
read VAR_PUSH_DH

if [[ $VAR_PUSH_DH = 'y' ]]
then
  docker image push --all-tags aleksshdevops/web_netology
elif [[  $VAR_PUSH_DH = 'n' ]]
then
  echo "Skip pushing.."
else
  echo "You entered something wrong! Skip pushing.."
fi
