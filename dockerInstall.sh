#!/bin/bash


apt-get update
apt-get install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

cat > /etc/apt/sources.list.d/docker.list << EOF
deb https://apt.dockerproject.org/repo ubuntu-trusty main
EOF

apt-get update
apt-get purge lxc-docker
apt-cache policy docker-engine

apt-get update
apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual

apt-get update
apt-get install docker-engine
service docker start
docker run hello-world
apt-get upgrade docker-engine
