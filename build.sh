#!/bin/bash

echo "How many containers? "
read qty

echo "What size?"
echo "t2.nano = 512m | t2.micro = 1024m"
read size

IMAGE_VERSION="lurer-ubuntu"

for ((i = 1; i <= $qty; i++)); do 
     lxc launch $IMAGE_VERSION u$i -t $size
done

sleep 10

lxc list
