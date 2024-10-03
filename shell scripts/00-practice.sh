#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[1;34m" 
N="\e[0m"

#Eample 1
DATE=$(date +%F--%T)

echo -e "The script $G$0$N started executing at $DATE"

#Eample 2
if [ $1 -gt "50" ]
then 
    echo -e "The number $G$1$N is greater than 50 $N"
else
    echo -e "$R The number $1 is less than 50 $N"
fi

#Eample 3
echo "What is today ??"
read today

if [ $today = "Sunday" ]
then        
    echo "Today is $today, Happy Holiday"
else
    echo "Today is $today, Go to school"
fi

#Eample 4
echo "What is today's class number ??"

read number

if [ $number -gt "5" ]
then
    echo -e "Today is$R Private$N Class"
else
    echo -e "Today is $G Public$N Class"
fi

#Eample 5
if [ -f "/c/AWS_DevOps/example.txt" ]
then
    echo "File exists"
else
    echo "File does not exists"
fi


#Eample 6
if [ $(whoami) = 'root' ]; then
    echo "You are the root user."
else
    echo "You are not the root user."
fi

#Eample 7
greet_user() {
    echo "Hello $1, $2!"
}

echo "Enter your name:"
read name
greet_user "$name" "Good Morning!"
