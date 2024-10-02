#!/bin/bash

#Check if Users has Root access or not
ID=$(id -u)

if [ $ID = 0 ]
then
    echo "You are a root user, PROCEED"
else
    echo "You do not have root permissions to execute this"
    exit 1
fi

yum insstall mysql -y

if [ $? = 0 ]
then    
    echo "Installation is SUCCESS"
else
    echo "Installation FAILED"
fi