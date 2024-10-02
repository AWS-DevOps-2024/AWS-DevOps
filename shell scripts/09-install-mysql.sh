#!/bin/bash

#Check if Users has Root access or not
ID=$(id -u)

if [ $ID = 0 ]
then
    echo "You are a root user, PROCEED"
    exit 1
else
    echo "You do not have root permissions to execute this"
    exit 1
fi

yum install mysql -y