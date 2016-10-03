#!/bin/bash


sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

DIR="$( cd "$( dirname "$BASH_SOURCE[0]}" )" && pwd )"
sudo mv $DIR/docker.list /etc/apt/sources.list.d/docker.list

sudo apt-get update
sudo apt-get purge lxc-docker
apt-cache policy docker-engine

sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual

sudo apt-get update
sudo apt-get install docker-engine -y
sudo service docker start
sudo docker run hello-world
sudo docker info
