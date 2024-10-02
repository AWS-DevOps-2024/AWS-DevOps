#!/bin/bash


echo "Please provide the number:"
read NUMBER

if [ $NUMBER -gt "50" ]
then
    echo "Given number is greater than 50"
else
    echo "Given number is less than 50"
fi