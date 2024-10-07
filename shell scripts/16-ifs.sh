#!/bin/bash

file="/etc/passwd"

while IFS=":" read -r username password user_id group_id user_fullname home_dir shell_path
do
    echo "Username:: $username"
    echo "User Full Name:: $user_fullname"
    echo "User ID:: $user_id"
    echo "Home Directory:: $home_dir"
done < $file