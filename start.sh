#!/bin/bash

IMAGE_VERSION="ubu16-02-2019"
SIZE="t2.nano"

for ((i = 1; i <= 10; i++)); do
	lxc start u$i
done

sleep 10

lxc list
