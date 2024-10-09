#!/bin/bash

R="\e[31m"
N="\e[0m"

DISK_USAGE=$(df -hT | grep xvd)
DISK_THRESHOLD=1
# message=""

while IFS= read -r line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1F}')

    if [ $usage -gt $DISK_THRESHOLD ]
    then
        message+="High Disk Usage on $partition::$R$usage%$N <br>"
    fi
done <<< $DISK_USAGE

echo -e "$message"

# echo "$message" | mail -s "High Disk Usage" cloudtechprem@gmail.com

sh mail.sh "DevOps Team" "High Disk Usage" "$message" "cloudtechprem@gmail.com" "ALERT High Disk Usage"

