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

URL='https://download.sublimetext.com/sublime-text_build-3126_amd64.deb'
FILE='sublimetemp.deb'
wget "$URL" -qO $FILE && sudo dpkg -i $FILE
rm $FILE
sudo apt-get install -f
mkdir -p ~/.config/sublime-text-3/Packages/User/
ln -s -f $DIR/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

echo ''
echo '################# Sublime Text Installed #################################'
echo '##########################################################################'


# Set up the .bash_profile
echo '##########################################################################'
echo '################# Bash set up ############################################'
echo ''

ln -s -f $DIR/dotbash_profile ~/.bash_profile
ln -s -f $DIR/dotbash_aliases ~/.bash_aliases
ln -s -f $DIR/dotbashrc ~/.bash_rc

echo ''
echo '################# Bash is set up #########################################'
echo '##########################################################################'

gnome-terminal
