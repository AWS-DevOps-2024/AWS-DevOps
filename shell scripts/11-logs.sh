#!/bin/bash

ID=$(id -u)
#echo "Script name :: $0" # $0 --> it denotes the script name by default
TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE="/tmp/$0-$TIMESTAMP.log"

echo "Script started executing at $TIMESTAMP" >>$LOG_FILE

R="\e[31m" #Red Colour
G="\e[32m" #Green Colour
Y="\e[33m" #Yellow Colour
N="\e[0m" #No Colour

VALIDATE(){
    if [ $1 -ne "0" ] # $? --> is the result of the previous command, If it is success then it will be 0 or failed then it is othan than 0 (ex: any nimber 1,34, 56 etc)
    then    
        echo -e "ERROR:: $2... $R FAILED $N"
        exit 1
    else
        echo -e "$2 is... $G SUCCESS $N"
    fi
}


if [ $ID = "0" ] #Here "="means is equal to, we can also use "-ne" means not equal to
then
    echo "You are a root user, PROCEED"
else
    echo -e "$R ERROR:: You do not have root permissions to execute this $N"
    exit 1
fi

yum install mysql -y &>> $LOG_FILE
VALIDATE $? "Installing MySQL" #($2) # We are giving the arguments to VALIDATE function
# In the Validate function 
    # --- $1 is $?
    # --- $2 is "Installing MySQL or GIT"

yum install git -y &>> $LOG_FILE
VALIDATE $? "Installing GIT"