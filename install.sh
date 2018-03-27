#!/bin/bash
server=$1
image=$2
regUsername=$3
regPassword=$4

echo "DEBUG: sudo docker login $server -u $regUsername -p $regPassword && sudo nvidia-docker run -d -p 80:8888 sherbrooke.azurecr.io/textworld-techfest:v2"
n=0
until [ $n -ge 5 ]
do
  sudo docker login $server -u $regUsername -p $regPassword && sudo nvidia-docker run -d -p 80:8888 sherbrooke.azurecr.io/textworld-techfest:v2 && break 
  echo "Failed to start the docker image. Will retry in 15 seconds"
  n=$[$n+1]
  sleep 15
done

