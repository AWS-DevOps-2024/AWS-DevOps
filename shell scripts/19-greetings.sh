#!/bin/bash

NAME=""
WISHES=""

USAGE(){
    echo "USAGE:: $(basename $0) -n <name> -w <wishes>"
    echo "Options"
    echo "-n, Specify the name"
    echo "-w, Specify the wishes"
    echo "-h, Display the help and exit"
}

while getopts ":n:w:h" opt; do 
    case $opt in 
        n) NAME="$OPTARG";;
        w) WISHES="$OPTARG";;
        n|*) USAGE; exit;;
    esac
done