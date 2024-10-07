#!/bin/bash

R="\e[31m"
N="\e[0m"

DISK_USAGE=$(df -hT | grep xvd)
DISK_THRESHOLD=1
MESSAGE=""

while IFS= read -r line
do
    usage=$(echo df -hT | grep xvd | awk '{print $6F}')
done <<< $DISK_USAGE

echo "$usage"