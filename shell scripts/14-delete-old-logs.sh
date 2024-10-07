#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# SOURCE_DIR="/tmp/shell-logs"
SOURCE_DIR=$1

# if [ ! -d $SOURCE_DIR ]
# then
#     echo -e "Source Directory $R $SOURCE_DIR $N does not Exist"
# else
#     echo -e "Source Directory $G $SOURCE_DIR $N Exists"
# fi

# #Find files to delete

if [ ! -d $1 ]
then
    echo "Source Directory $1 does not Exist"
else
    echo "Source Directory is Valid"
fi

FILES_TO_DELETE=$(find $1 -type f -mtime +15 -name "*.log")

while IFS= read -r line
do
    echo "Deleting File:: $line"
    rm -rf $line
done <<< $FILES_TO_DELETE
    