#!/bin/bash

FILE_TO_READ=$(cat sample.txt) 

while IFS= read -r line
do
    echo "$line"
done <<< $FILE_TO_READ