#!/bin/bash

R="\e[31m"
N="\e[0m"

DISK_USAGE=$(df -hT | grep xvd)
DISK_THRESHOLD=1
MESSAGE=""

