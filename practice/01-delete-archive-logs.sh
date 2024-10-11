#!/bin/bash

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

# source_dir=""
# action=""
# destination_dir=""
# time=""
# memory=""


R="\e[31m"
G="\e[32m"
N="\e[0m"

USAGE(){
    echo "USAGE:: $(basename $0) -s <source-directory> -a <action> -d <destination-directory> -t <retention-time> -m <memory> "
    echo "OPTIONS"
    echo " Source Directory (mandatory)"
    echo " Action (Delete or Archive)"
    echo " -d,  --Destination Directory (If You select Archive as the action then need to provide the destination directory otherwise it is Optional)"
    echo " -t,  --Retention time in days (Optional)"
    echo " -m,  --Memory (Optional)"
    echo " -h,  --Display help and exit"
}

VALIDATE(){
    if [ $1 -ne "0" ]
    then
        echo -e "Archiving is $R Failed$N"
        exit 1
    else
        echo -e "$G Files are successfully archived$N"
    fi
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

echo "Please enter source directory"
read source_dir
if [ ! -d $source_dir ]
    then
        echo -e "Source directory $R$source_dir$N does not exist, Please enter correct source directory" 
    else
        echo -e "Source directory $G$source_dir$N exist"
fi

# check if action is provided or not
echo "Please specify the action: delete or archive ?"
read action

if [ "$action" != "archive" ] || [ "$action" != "delete" ] || [ -z $action ];
    then
        echo -e "$R ERROR::$N $R action $N is mandatory, You need to select either $G archive $N or $G delete $N option only$N"

        if [ "$action" == "archive" ] 
        then
            echo "Please provide the destination"
            read destination_dir
            if [ ! -d $destination_dir ]
            then
                echo -e "$RDestination$N directory does not exist"
                exit 1
            else
                files_to_archive=$(find $source_dir -type f -name "*.log")
                while IFS= read -r line
                do
                    echo -e "Archiving files:: $G$line$N"
                    zip -r "$destination_dir/zip-files.zip" "$line"
                    VALIDATE $? 
                done <<< $files_to_archive
            fi
        fi
fi


# if [ "$action" == "delete" ] 
# then
#     files_to_delete=$(find $source_dir -type f -name "*.log")
#     while IFS= read -r line
#     do
#         echo "Deleting the files $line"
#         rm -rf $line
#     done <<< $files_to_delete
# fi

