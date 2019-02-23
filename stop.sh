#!/bin/bash

for ((i = 1; i <= 254; i++)); do
     lxc stop u$i --force 
done

