#!/bin/bash


# This script adds the cuurent user to the sudo and root group for Docker


# Globals

PROFILE=$(whoami)


# Add user to groups

sudo usermod -a -G sudo $PROFILE
sudo usermod -a -G root $PROFILE
