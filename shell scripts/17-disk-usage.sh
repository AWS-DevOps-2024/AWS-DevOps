#!/bin/bash

R="\e[31m"
N="\e[0m"

DISK_USAGE=$(df -hT | grep xvd | awk '{print $6F}')
DISK_THRESHOLD=1
message=""

while IFS= read -r line
do
    usage=$(echo df -hT | grep xvd | awk '{print $6F}')
    partition=$(echo df -hT | grep xvd | awk '{print $1F}')

    if [ $usage -gt $DISK_THRESHOLD ]
    then
        message+="High Disk Usage on $partition::$usage\n"
    fi
done <<< $DISK_USAGE

    echo "$message"
