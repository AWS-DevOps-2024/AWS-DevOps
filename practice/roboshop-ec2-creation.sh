#!/bin/bash

instances=("mongodb" "web" "mysql" )


for i in "$instances[@]"
do
    if [ $i == "mongodb" ] || [ $i == "mysql" ]
    then 
        instance_type="t2.small"
    else
        instance_type="t2.micro"
    fi
    aws ec2 run-instances --image-id ami-0b4f379183e5706b9 --instance-type $instance_type --security-group-ids sg-04d3cc3675c0c646f --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]"
done


# aws ec2 run-instances --image-id ami-0b4f379183e5706b9 --instance-type t2.micro --security-group-ids sg-04d3cc3675c0c646f --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Web}]'