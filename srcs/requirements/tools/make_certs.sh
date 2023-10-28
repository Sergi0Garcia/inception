#!/bin/bash

directory="./srcs/requirements/nginx"
cert_name="segarcia.42.fr.crt"
cert_key="segarcia.42.fr.key"

if [ -e "$directory/tools/$cert_name" ] && [ -e "$directory/tools/$cert_key"]; then
	echo "CERTS FOUND"
else
	if [ -d "$directory/tools" ]; then
		rm -rf "$directory/tools"
	fi

	mkcert segarcia.42.fr
	mkdir -p $directory/tools
	mv segarcia.42.fr.pem $directory/tools/segarcia.42.fr.crt
	mv segarcia.42.fr-key.pem $directory/tools/segarcia.42.fr.key
fi
