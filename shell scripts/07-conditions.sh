#!/bin/bash

echo "what is today ?"
read TODAY 

if [ $TODAY != "Sunday" ]   
then
    echo "$TODAY is not a Holiday"
else
    echo "$TODAY is Holiday"
fi



