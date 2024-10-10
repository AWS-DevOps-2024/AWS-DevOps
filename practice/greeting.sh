#!/bin/bash

name=""
wish="Good Morning"

USAGE(){
    echo "USAGE:: $(basename $0) -n <name> -w <wish>"
    echo "Options"
    echo "-n,  --Please provide the name (mandatory)"
    echo "-w,  --Specify the wishes (Optional), default value is "Good Morning""
    echo "-h,  --Display help and exit"
}

while getopts ":n:w:h" opt; do
      case $opt in
        n ) name="$OPTARG";;
        w ) wish="$OPTARG";;
        h ) help="$OPTARG";;
        \?) echo "Invalid option: -"$OPTARG"" >&2; USAGE; exit 1;;
        : ) echo "Option -"$OPTARG" requires an argument." >&2; USAGE; exit 1;;
      esac
    done

if [ -z $name ]
then
    echo "ERROR:: -n, is mandatory option"
    USAGE; exit 1;
fi

echo "Hello $wish my name is $name, I'm learning optargs in shell scripting"