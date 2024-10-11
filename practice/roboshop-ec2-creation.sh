#!/bin/bash

# instances=("mongodb" "web" "mysql" )

# aws ec2 run-instances --image-id ami-0b4f379183e5706b9 --instance-type t2.micro --security-group-ids sg-04d3cc3675c0c646f --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=$instances[0]}]'

aws ec2 run-instances --image-id ami-0b4f379183e5706b9 --instance-type t2.micro --security-group-ids sg-04d3cc3675c0c646f --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Web}]'