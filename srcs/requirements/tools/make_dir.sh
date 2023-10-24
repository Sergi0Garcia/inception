#!/bin/bash

if [[ ! -d "/home/${USER}/data" ] || [[${USER} == "root" ] && [! -d "/root/data"] ]]; then
        mkdir ~/data
        mkdir ~/data/mariadb
        mkdir ~/data/wordpress
else
	echo "Directories already exists"
fi
