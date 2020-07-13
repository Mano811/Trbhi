#!/bin/bash
sudo apt update -y
sudo apt install docker.io -y
sudo systemctl start docker
#sudo systemctl enable docker
sudo docker pull docker.elastic.co/elasticsearch/elasticsearch:7.8.0
sudo docker ps -a |grep docker.elastic.co/elasticsearch/elasticsearch
if [ $? -eq 0 ]
then
echo "ELASTICSEARCH CONTAINER ALREADY RUNNING"
echo "ELASTICSEARCH HEALTH"
curl localhost:9200/_cat/health
else
echo "STARTING ELASTICSEARCH CONTAINER"
sudo docker run -d -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.8.0
sleep 30
echo "ELASTICSEARCH HEALTH"
curl localhost:9200/_cat/health
fi

