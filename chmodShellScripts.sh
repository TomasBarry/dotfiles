#!/bin/bash


# This file changes the mode of every shell script in the directory
# containing this file (recursively)
# Files that end in .sh are changed to u+x meaning that they are
# executable by the current user

# Globals

# The directory containing this file
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Change the mode of all .sh files in the current directory (and
# in all sub directories to executable
chmod u+x $DIR/**/*.sh
