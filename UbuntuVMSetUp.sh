#!/bin/bash


# This file sets up a VM on a Dell XPS 13 to custom preferences
# This file can be run after the VM is created


# Set the screen scale factor as the Dell XPS 13 has an extremely high resolution
# resulting in everything being tiny in the VM view
dconf write /com/ubuntu/user-interface/scale-factor "{'Virtual1': 14}"


# Set the keyboard layout to English UK
setxkbmap -layout gb


# Download and set up Sublime Text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer


# Set up the .bash_profile
mv .bash_profile ~/.bash_profile
