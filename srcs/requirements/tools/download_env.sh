#!/bin/bash

cd ../..

DOPPLER_PATH="/home/linuxbrew/.linuxbrew/Cellar/doppler/3.66.3/bin/doppler"
$DOPPLER_PATH secrets download --no-file --format docker > .env
