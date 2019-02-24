#!/bin/bash

echo "How many containers? "
read qty

echo "What size?"
echo "t2.nano = 512m | t2.micro = 1024m"
read size

IMAGE_VERSION="lurer-ubuntu"

for ((i = 1; i <= $qty; i++)); do 
     lxc launch $IMAGE_VERSION u$i -t $size -c device set u$i eth0 ipv4.address 10.96.96.$i
done

sleep 10

lxc list
