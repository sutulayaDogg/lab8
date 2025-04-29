#!/bin/bash -x

#delet old container
docker stop nginx-cont
docker rm nginx-cont

# build image
docker build -t devops/nginx-server ./nginx

#create and build container
docker run -d --name nginx-cont -p 54321:80 \
  --restart unless-stopped \
  devops/nginx-server

#check
docker ps -a
sleep 5
curl 127.0.0.1:54321
docker logs -n 10 nginx-cont
