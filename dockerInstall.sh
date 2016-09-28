#!/bin/bash


sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sudo cat > /etc/apt/sources.list.d/docker.list << EOF
deb https://apt.dockerproject.org/repo ubuntu-trusty main
EOF

sudo apt-get update
sudo apt-get purge lxc-docker
apt-cache policy docker-engine

sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual

sudo apt-get update
sudo apt-get install docker-engine
sudo service docker start
sudo docker run hello-world
sudo apt-get upgrade docker-engine
