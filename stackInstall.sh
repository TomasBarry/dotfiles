#!/bin/bash


# make required folder
mkdir ~/home/barryto/.local/bin


# Update the PATH variable
export PATH="$PATH:/home/barryto/.local/bin"


# Download and install stack
curl -sSL https://get.haskellstack.org/ | sh
