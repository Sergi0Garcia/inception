#!/bin/bash

directory="./srcs/requirements/nginx/tools"
cert_name="segarcia.42.fr.crt"
cert_key="segarcia.42.fr.key"

if [ -e "$directory/$cert_name" ]; then
	echo "CERTS FOUND"
else
	mkcert segarcia.42.fr
	mkdir -p $directory/tools
	mv segarcia.42.fr.pem $directory/segarcia.42.fr.crt
	mv segarcia.42.fr-key.pem $directory/segarcia.42.fr.key
fi
