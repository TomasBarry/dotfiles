#!/bin/bash


# This file sets up a VM on a Dell XPS 13 to custom preferences
# This file can be run after the VM is created


# Globals

# Directory containing this file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Set the screen scale factor as the Dell XPS 13 has an extremely high resolution
# resulting in everything being tiny in the VM view
echo '##########################################################################'
echo '##################### Setting screen resolution ##########################'
echo ''

gsettings set com.ubuntu.user-interface scale-factor "{'Virtual1': 14}"

echo ''
echo '##################### Screen resolution set ##############################'
echo '##########################################################################'


# Set the keyboard layout to English UK
echo '##########################################################################'
echo '#################### Setting keyboard layout #############################'
echo ''

setxkbmap -layout gb

echo ''
echo '################### Set keyboard layout #################################'
echo '##########################################################################'


# Download and set up Sublime Text 3
echo '##########################################################################'
echo '################## Installing Sublime Text ###############################'
echo ''

sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer

echo ''
echo '################# Sublime Text Installed #################################'
echo '##########################################################################'


# Set up the .bash_profile
echo '##########################################################################'
echo '################# Bash set up ############################################'
echo ''

cp $DIR/dotbash_profile ~/.bash_profile
cp $DIR/dobbash_aliases ~/.bash_aliases
cp $DIR/dotbashrc ~/.bash_rc

echo ''
echo '################# Bash is set up #########################################'
echo '##########################################################################'
