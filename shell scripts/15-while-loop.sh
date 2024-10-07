#!/bin/bash

R="\e[31m"
N="\e[0m"

FILE_TO_READ=$(cat sample.txt) 

while IFS= read -r line
do
    echo -e "Deleting the line:: $R $line $N"   
done <<< $FILE_TO_READ