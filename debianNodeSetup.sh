#!/bin/bash

apt-get install curl -y

#wget -qO- https://get.docker.com/ | sh
#docker version

#mkdir /etc/systemd/system/docker.service.d
#touch /etc/systemd/system/docker.service.d/http-proxy.conf
#echo '[Service]' >> /etc/systemd/system/docker.service.d/http-proxy.conf
#echo 'Environment="HTTP_PROXY=http://www-proxy.scss.tcd.ie:8080/"' >> /etc/systemd/system/docker.service.d/http-proxy.conf
#systemctl daemon-reload
#systemctl show --property Environment docker
#systemctl restart docker
#docker run hello-world

curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-` uname -m` >          /usr/local/bin/docker-machine && chmod +x /usr/local/bin/docker-machine
docker-machine version

wget https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-prompt.bash -P /etc/bash_completion.d/
source /etc/bash_completion.d/docker-machine-prompt.bash 
echo 'PS1=\'[\u@\h \W$(__docker_machine_ps1 " [%s]")]\$ \'' >> ~/.bashrc

wget https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-wrapper.bash -P /etc/bash_completion.d/
source /etc/bash_completion.d/docker-machine-wrapper.bash 

wget https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash -P /etc/bash_completion.d/
source /etc/bash_completion.d/docker-machine.bash 

wget https://storage.googleapis.com/golang/go1.6.3.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.6.3.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile

mkdir ~/gowork

echo 'export GOPATH=$HOME/gowork' >> ~/.bashrc
source ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
source ~/.bashrc

source /etc/profile

go get github.com/tools/godep
apt-get install bzr -y
go get github.com/OpenNebula/docker-machine-opennebula
cd $GOPATH/src/github.com/OpenNebula/docker-machine-opennebula
make build
make install

cd
mkdir ~/.one
echo "username:password" > ~/.one/one_auth
chmod 400 ~/.one/one_auth  

echo 'export ONE_XMLRPC=http://scssnebulamgr.scss.tcd.ie:2633/RPC2' >> ~/.bashrc 
echo 'export ONE_AUTH=~/.one/one_auth' >> ~/.bashrc  
source ~/.bashrc




