#!/bin/bash

apt-get install curl -Y

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

curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-` uname -m` >          /usr/local/bin/docker-machine && chmod +x /usr/local/bin/docker-machine

wget https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-prompt.bash -P /etc/bash_completion.d/
source /etc/bash_completion.d/docker-machine-prompt.bash 
PS1='[\u@\h \W$(__docker_machine_ps1 " [%s]")]\$ '

wget https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-wrapper.bash -P /etc/bash_completion.d/
source /etc/bash_completion.d/docker-machine-wrapper.bash 

wget https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash -P /etc/bash_completion.d/
source /etc/bash_completion.d/docker-machine.bash 
