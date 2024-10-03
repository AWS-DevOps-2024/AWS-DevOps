#!/bin/bash

#Giving the colours
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

ID=$(id -u)
LOG_FILE="/tmp/$0-$(date +%F--%T).log"

VALIDATE() {
    if [ $1 -ne "0" ]
    then    
        echo -e "$2 is...$R FAILED$N"
        exit 1
    else
        echo -e "$2 is...$G SUCCESS$N"
    fi
}    
    
#Check if you are a root user or not

if [ $ID -ne "0" ]
then    
    echo -e "$R ERROR$N:: You are not a Root User, Please run this with root access."
    exit 1
else
    echo -e "You are a Root User...$G PROCEED$N"
fi

yum install git -y &>> $LOG_FILE

VALIDATE $? "Installing GIT"
