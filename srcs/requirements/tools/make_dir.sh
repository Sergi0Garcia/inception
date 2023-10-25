#!/bin/bash

if [[ ! -d "/home/${USER}/data" || ( ${USER} == "root" && ! -d "/root/data" ) ]]; then
        mkdir -p /home/${USER}/data/mariadb
        mkdir -p /home/${USER}/data/wordpress
else
        echo "Directories already exist"
fi
