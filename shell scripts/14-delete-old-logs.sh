#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# SOURCE_DIR="/tmp/shell-logs"
SOURCE_DIR=$1

if [ ! -d $1 ]
then
    echo -e "Source Directory $R $1 $N does not Exist"
else
    echo -e "Source Directory $G $1 $N Exists"
fi

# #Find files to delete
# FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")

# while IFS= read -r line
# do 
#     echo "Deleting file:: $line"
#     rm -rf $line
# done <<< $FILES_TO_DELETE