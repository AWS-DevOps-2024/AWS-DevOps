#!/bin/bash

#Example 1

# USERNAME=$1
# PASSWORD=$2

# echo "Username is $USERNAME and Password is $PASSWORD"

#Example2

echo "Please enter your username :"
read -s USERNAME # It will not read or echo the input that you have given in the command line
echo "Enter your password"
read -s PASSWORD
echo "Username is $USERNAME, and Password is $PASSWORD"



