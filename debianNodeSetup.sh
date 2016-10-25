#!/bin/bash

wget -qO- https://get.docker.com/ | sh
docker version

mkdir /etc/systemd/system/docker.service.d
touch /etc/systemd/system/docker.service.d/http-proxy.conf
echo '[Service]' >> /etc/systemd/system/docker.service.d/http-proxy.conf
echo 'Environment="HTTP_PROXY=http://www-proxy.scss.tcd.ie:8080/"' >> /etc/systemd/system/docker.service.d/http-proxy.conf
systemctl daemon-reload
systemctl show --property Environment docker
systemctl restart docker
docker run hello-world
