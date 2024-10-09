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
        echo -e "$2...$R FAILED$N"
        exit 1
    else
        echo -e "$2...$G SUCCESS$N"
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

yum -y install postfix cyrus-sasl-plain mailx &>> $LOG_FILE
VALIDATE $? "Installing PostFix"

systemctl restart postfix &>> $LOG_FILE
VALIDATE $? "Restarting PostFix"

systemctl enable postfix &>> $LOG_FILE
VALIDATE $? "Enabling PostFix"

rm -rf /etc/postfix/main.cf &>> $LOG_FILE
VALIDATE $? "Remove main.cf file"

# cd  cd /home/centos/AWS-DevOps/shell\ scripts/ &>> $LOG_FILE
# VALIDATE $? "Go to shell script directory"

cp /home/centos/AWS-DevOps/shell\ scripts//main.cf /etc/postfix/ &>> $LOG_FILE
VALIDATE $? "Copying main.cf file"

cp /home/centos/AWS-DevOps/shell\ scripts//sasl_passwd /etc/postfix/sasl_passwd &>> $LOG_FILE
VALIDATE $? "Copying sasl_passwd file"

postmap /etc/postfix/sasl_passwd &>> $LOG_FILE
VALIDATE $? "mapping the password file"

# echo "This is a test mail & Date $(date)" | mail -s "Test Email" cloudtechprem@gmail.com &>> $LOG_FILE
# VALIDATE $? "Sending test Email"

