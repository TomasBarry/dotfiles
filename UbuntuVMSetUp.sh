#!/bin/bash


# This file sets up a VM on a Dell XPS 13 to custom preferences
# This file can be run after the VM is created


# Set the screen scale factor as the Dell XPS 13 has an extremely high resolution
# resulting in everything being tiny in the VM view
dconf write /com/ubuntu/user-interface/scale-factor "{'Virtual1': 14}"


# Download and set up Sublime Text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer


# Set up the .bash_profile
echo "
#!/bin/bash


###################################################################################
###################################################################################
# Git Shortcuts
###################################################################################
###################################################################################


alias gis='git status'
alias gial='git add -A'

###################################################################################
###################################################################################


###################################################################################
###################################################################################
# Quick commands
###################################################################################
###################################################################################


# Clear screen
function c() {
	clear
}

# List contents of current directory
function l() {
	ls
}

# Go back up a directory
function u() {
	cd ..
}

# Exit session
function e() {
	exit
}

###################################################################################
###################################################################################


###################################################################################
###################################################################################
# Useful command shortcuts
###################################################################################
###################################################################################


# quickly edit the bash_profile no matter wherever you are
alias bprofile='nano ~/.bash_profile'

# alias for sublime text
alias sublime='~/opt/sublime_text/sublime_text'

# Make a directory and immediately change into it
# usage:
# user:~$ mkdircd folder_name
# user:~/folder_name$
function mkdircd() {
    command mkdir $1 && cd $1
}

# easier way to go up N levels when deep in a path
# usage:
# user:~/a/b/c/d/e/f/g/h/i$ up 2
# user:~/a/b/c/d/e/f/g$
function up() {
    LIMIT=$1
    P=$PWD
    for ((i=1; i <= LIMIT; i++))
    do
        P=$P/..
    done
    cd $P
    export MPWD=$P
}

# did you overshoot using up? Quickly correct your mistake
# usage:
# user:~/a/b/c/d/e/f/g$ back 1
# user:~/a/b/c/d/e/f/g/h$
function back() {
    LIMIT=$1
    P=$MPWD
    for ((i=1; i <= LIMIT; i++))
    do
        P=${P%/..}
    done
    cd $P
    export MPWD=$P
}

# List the IP addresses associated with the machine
function getMyIP() {
	ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
}


######################################################################################
######################################################################################

" >> ~/.bash_profile


# Execute the .bash_profile
. ~/.bash_profile
