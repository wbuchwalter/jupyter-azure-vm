#!/bin/bash
server=$1
image=$2
regUsername=$3
regPassword=$4

sudo docker login $server -u $regUsername -p $regPassword && sudo nvidia-docker run -d -p 80:8888 $image
