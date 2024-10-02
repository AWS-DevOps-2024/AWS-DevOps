#!/bin/bash

#Check if Users has Root access or not 
ID=$(id -u)

if [ $ID = "0" ] #Here "="means is equal to, we can also use "-ne" means not equal to
then
    echo "You are a root user, PROCEED"
else
    echo "ERROR:: You do not have root permissions to execute this"
    exit 1
fi

yum install mysql -y

if [ $? -ne "0" ] # $? --> is the result of the previous command, If it is success then it will be 0 or failed then it is othan than 0 (ex: any nimber 1,34, 56 etc)
then    
    echo "ERROR:: Installation FAILED"
    exit 1
else
    echo "Installation is SUCESS"
fi