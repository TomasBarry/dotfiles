#!/bin/bash


# Install Stack on the current machine


# Globals
USER=$(whoami)


# Update the PATH variable
export PATH="$PATH:/home/$USER/.local/bin"


# Download and install stack
setterm -term linux -fore 'cyan'

echo '#################################################################'
echo '################### Installing Stack ############################'
echo ''

curl -sSL https://get.haskellstack.org/ | sh

echo ''
echo '################## Stack has been installed #####################'
echo '#################################################################'

setterm -term linux -fore 'white'
