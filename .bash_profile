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
alias sublime='/opt/sublime_text/sublime_text'

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
