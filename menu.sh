#!/bin/bash

echo ""
PS3='DO IT: '
options=("Build" "Restart" "Stop" "Destroy" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Build")
            bash build.sh
            break
            ;;
        "Restart")
            bash restart.sh
            break
            ;;
        "Stop")
            bash stop.sh
            break
            ;;
        "Destroy")
            bash destroy.sh
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
