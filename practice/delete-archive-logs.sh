#!/bin/bash

# Requirement is below

# A script to delete/archive old logs in source directory, if user action is delete, delete them. If user action is archive zip them and keep it into destination directory
# User have to provide
# Source directory
# Action. Either archive or delete
# If archive, he must provide destination. If delete no need of destination
# Days. How many days old. by default 14 days
# Memory. Optional. if user gives consider it otherwise dont consider memory
# Example
# sh old-logs.sh -s <source-dir> -a <archive|delete> -d <destination> -t <day> -m <memory-in-mb>

# Sample
# sh old-logs.sh -s "/tmp/shellscript-logs" -a delete  -t 7 -m 10

# Validations

# User has given all required input or not
# Directories are exist or not

source_dir=""
action=""
destination_dir=""
time="14"
memory=""

USAGE(){
    echo "USAGE:: $(basename $0) -s <source-directory> -a <action> -d <destination-directory> -t <retention-time> -m <memory> "
    echo "OPTIONS"
    echo " -s,  --Source Directory (mandatory)"
    echo " -a,  --Action (Delete or Archive)"
    echo " -d,  --Destination Directory (If You select Archive as the action then need to provide the destination directory otherwise it is Optional)"
    echo " -t,  --Retention time in days (Optional)"
    echo " -m,  --Memory (Optional)"
    echo " -h,  --Display help and exit"
}

while getopts ":s:a:d:t:m:h" opt; do
      case $opt in
        s ) source_dir="$OPTARG";;
        a ) action="$OPTARG";;
        d ) destination_dir="$OPTARG";;
        t ) time="$OPTARG";;
        m ) memory="$OPTARG";;
        h ) help="$OPTARG";;
        \?) echo "Invalid option: -"$OPTARG"" >&2; USAGE; exit 1;;
        : ) echo "Option -"$OPTARG" requires an argument." >&2; USAGE; exit 1;;
      esac
    done

#Find if the source directory exist or not

if [ ! -d $source_dir ]
then
    echo "Source directory $source_dir does not exist" ; 
    USAGE 
    exit 1
fi

# find if action is provided or not

if [ -z $action ]
then
    echo "-a is mandatory option" 
    USAGE 
    exit 1
fi

# FInd if user provided the destination or not when action = archive 

if [ "$action" == "archive" ] && [ ! -d "$destination_dir" ]
then
    echo "ERROR: -d destination directory is mandatory when -a is archive" 
    USAGE 
    exit 1
fi 

#################################
## If User selects delete

if [ "$action" == "delete" ]
then
    FILES_TO_DELETE=$(find $source_dir -type f -name "*.log")
    while IFS= read -r line
    do
        echo "Deleting File:: $line"
        rm -rf $line
    done <<< $FILES_TO_DELETE
else
    FILES_TO_ARCHIVE=$(find $source_dir -type f -name "*.log")
    while IFS= read -r line
    do
        echo "Archiving the following Files:: $line"
        zip -r "$destination_dir/$(basename "$line").zip"
        # rm -rf $line
    done <<< $FILES_TO_ARCHIVE
fi
