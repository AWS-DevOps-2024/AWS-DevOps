#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[om"

SOURCE_DIR="/tmp/shell-logs"

if [ ! -d $SOURCE_DIR ]
then
    echo -e "Source Directory $R $SOURCE_DIR $N does not Exist"
fi

# #Find files to delete
# FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")

# while IFS= read -r line
# do 
#     echo "Deleting file:: $line"
#     rm -rf $line
# done <<< $FILES_TO_DELETE