#!/bin/bash

NAME=""
WISHES="Good Morning"

USAGE(){
    echo "USAGE:: $(basename $0) -n <name> -w <wishes>"
    echo "Options"
    echo " -n, --Specify the name (Mandatory)"
    #echo " -w, --Specify the wishes"
    echo " -w, --Specify the wishes (Optional)"
    echo " -h, --Display the help and exit"
}

while getopts ":n:w:h" opt; do 
    case $opt in 
        n) NAME="$OPTARG";;
        w) WISHES="$OPTARG";;
        \?) echo "Invalid Options: -"$OPTARG"" >&2; USAGE; exit;; #Inavlid Options
        h) USAGE; exit;; 
        :) USAGE; exit;; #empty Options
    esac
done

# if [ -z $NAME ] || [ -z "$WISHES" ] #we are giving "" to $WISHES because it will have spaces while giving options
# then
#     echo "ERROR:: Both -n and -w options are mandatory"
#     USAGE
#     exit 1
# fi

if [ -z $NAME ]
then
    echo "ERROR:: -n is mandatory and -w is optional"
    USAGE
    exit 1
fi

echo "Hello $NAME, $WISHES. I am learning GetOpts in Shell Script."