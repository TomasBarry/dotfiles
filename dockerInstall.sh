#!/bin/bash

# This script sets up Docker on the current machine
# Only users with root privilages will be able to use Docker


# Globals

# Directory containing this file
DIR="$( cd "$( dirname "$BASH_SOURCE[0]}" )" && pwd )"


# Install the prerequisits
echo '##################################################################'
echo '######### Installing Docker prerequisits #########################'
echo ''

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo ''
echo '####### Installed Docker prerequisits ############################'
echo '##################################################################'


# Create docker.list file (see docker.list file in parent directory)
sudo cp $DIR/docker.list /etc/apt/sources.list.d/docker.list


# Remove past install if one exists
echo '##################################################################'
echo '######### Removing past install of Docker if it exists ###########'
echo ''

sudo apt-get update
sudo apt-get purge lxc-docker
apt-cache policy docker-engine

echo ''
echo '########### Removed past install of Docker ######################'
echo '#################################################################'


# Install some extra linux kernel packages
echo '#################################################################'
echo '############# Installing extra requirements #####################'
echo ''

sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual

echo ''
echo '############# Extras installed ##################################'
echo '#################################################################'


# Install Docker and verify that it works
echo '#################################################################'
echo '#################### Installing Docker ##########################'
echo ''

sudo apt-get update
sudo apt-get install docker-engine

echo '#################################################################'
echo '#################### Starting Docker Service ####################'
echo ''

sudo service docker start
sudo docker run hello-world

echo ''
echo '################## Docker installed fully #######################'
echo '#################################################################'

echo '#################################################################'
echo '################## Create Docker group ##########################'
echo ''

sudo groupadd docker
sudo usermod -aG docker $USER
gnome-session-quit
