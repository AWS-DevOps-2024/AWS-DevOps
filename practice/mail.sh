#!/bin/bash

TO_TEAM=$1 # DevOps Team
ALERT_TYPE=$2 # High Disk Usage
BODY=$3 # $message
ESCAPE_BODY=$(printf '%s\n' "$BODY" | sed -e 's/[]\/$*.^[]/\\&/g'); # Escaping the special characters
TO_ADDRESS=$4 # cloudtechprem@gmail.com
SUBJECT=$5 # ALERT: High Disk Usage

FINAL_BODY=$(sed -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/BODY/$ESCAPE_BODY/g" template.html) # Replacing the place holders in template.html file

echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECT\nContent-Type: text/html")" "$TO_ADDRESS" # Sending email