#!/bin/bash


# This file sets up a VM on a Dell XPS 13 to custom preferences
# This file can be run after the VM is created


# Globals

# Directory containing this file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Array of possible text colours
declare -a colours=('black' 'blue' 'green' 'cyan' 'red' 'magenta' 'yellow');

# Counter for text colour switching
i=0


# Helper Functions

# Change the colour of the text output to the screen
function changeColour() {
	setterm -term linux -fore $colours[$i % ${#colours[@]}]
	i = i + 1
}


# Set the screen scale factor as the Dell XPS 13 has an extremely high resolution
# resulting in everything being tiny in the VM view
echo '##########################################################################'
echo '##################### Setting screen resolution ##########################'
echo ''

changeColour()
dconf write /com/ubuntu/user-interface/scale-factor "{'Virtual1': 14}"

echo ''
echo '##################### Screen resolution set ##############################'
echo '##########################################################################'


# Set the keyboard layout to English UK
echo '##########################################################################'
echo '#################### Setting keyboard layout #############################'
echo ''

changeColour()
setxkbmap -layout gb

echo ''
echo '################### Set keyboard layout #################################'
echo '##########################################################################'


# Download and set up Sublime Text 3
echo '##########################################################################'
echo '################## Installing Sublime Text ###############################'
echo ''

changeColour()
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer
sudo apt-get update

echo ''
echo '################# Sublime Text Installed #################################'
echo '##########################################################################'


# Set up the .bash_profile
echo '##########################################################################'
echo '################# Bash set up ############################################'
echo ''

changeColour()
cp $DIR/dotbash_profile ~/.bash_profile
cp $DIR/dobbash_aliases ~/.bash_aliases
cp $DIR/dotbashrc ~/.bash_rc

echo ''
echo '################# Bash is set up #########################################'
echo '##########################################################################'


setterm -term linux -fore 'white'
