#!/bin/bash

ssh-keygen -t rsa -b 4096 -C "tomas.barry@hotmail.com"
cat ~/.ssh/id_rsa.pub
