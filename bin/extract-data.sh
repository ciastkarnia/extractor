#!/bin/bash

#############################################
# preparing global variables
file=${1}

if [ "x${file}" = "x"] ; then
    echo "Wrong file ${file}!"
    exit 1
fi 
