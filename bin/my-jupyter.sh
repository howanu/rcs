#!/bin/bash

docker run --name my_jupyter -p 8888:8888 -v $HOME/work:/home/jovyan/work jupyter/scipy-notebook:latest &

sleep 10

TOKEN=$(docker exec my_jupyter jupyter notebook list | awk '{split($4,a," "); print a[1]}' FS="/")
IP=$(docker inspect -f '{{.NetworkSettings.IPAddress}}' my_jupyter)
chromium-browser "http://$IP:8888/$TOKEN"
