#!/bin/bash


# This script installs Haskell on the current machine


# Install Haskell
setterm -term linux -fore 'green'

echo '################################################################'
echo '###################### Installing Haskell ######################'
echo ''

sudo apt-get update
sudo apt-get install haskell-platform

echo ''
echo '##################### Haskell Installed ########################'
echo '################################################################'

setterm -term linux -fore 'white'
