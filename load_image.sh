#!/bin/sh

path=$1
name=$2
tag=$3

imageid=$(docker image load -i "$path"/"$name".tar -q | cut -d ':' -f 3)
docker tag "$imageid" "$tag"
