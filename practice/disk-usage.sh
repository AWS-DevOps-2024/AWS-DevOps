#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
THRESHOLD=1

while IFS= read -r line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1F}')
    if [ $usage -ge $THRESHOLD ]
    then    
        message+="High disk Usage on $partition:: $usage% <br>"
    fi
done <<< $DISK_USAGE

echo -e "$message"

sh mail.sh "DevOps Team" "High Disk Usage Alert" "$message" "cloudtechprem@gmail.com" "ALERT: High Disk Usage"