#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
THRESHOLD=1

while IFS= read -r line
do
    usage=$(echo $line | awk '{print 6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print 1F}')
    if [ $usage -ge $THRESHOLD ]
    then    
        message+=$(echo High disk Usage is on $partition:: $usage% \n)
done <<< $DISK_USAGE

echo -e "$message"