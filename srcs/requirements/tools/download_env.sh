#!/bin/bash

cd ../..
doppler secrets download --no-file --format docker > .env
