#!/bin/bash

#Find out the current disk usage and send an email if the usage is more than 2%

disk_usage="$(df -hT | grep -vE 'tmp|File')"
threshold=2

while IFS= read -r line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1) # It will print the usage percentage without % symbol
    partition=$(echo $line | awk '{print $1F}') # It will print the partition name
    if [ $usage -ge $threshold ]
    then
        message+="High Disk Usage is on $partition:: $usage% <br>"
    fi
done <<< $disk_usage

echo -e "$message"

sh mail.sh "DevOps Team" "High Disk Usage" "$message" "cloudtechprem@gmail.com" "SYSTEM | High Disk Usgae"