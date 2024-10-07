#!/bin/bash

R="\e[31m"
N="\e[0m"

DISK_USAGE=$(df -hT | grep xvd)
DISK_THRESHOLD=1
message=""

while IFS= read line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1F}')

    if [ $usage -ge $DISK_THRESHOLD ]
    then
        message+="High Disk Usage on $partition::$usage\n"
    fi
done <<< $DISK_USAGE

echo -e "Message:: $message"
