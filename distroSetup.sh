#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

./$DIR/stackInstall.sh
./$DIR/dockerInstall.sh
./$DIR/restStackProject.sh
