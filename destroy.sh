#!/bin/bash


echo "How many we break? "
read qty

for ((i = 1; i <= $qty; i++)); do
        lxc delete --force u$i 
done

echo""
echo "*COMPLETE*"
echo ""
lxc list
echo ""
