#!/bin/bash


# Prompt user for source directory
read -p "Enter the source directory: " source_directory

# Check if source directory exists
if [ ! -d "$source_directory" ]; then
  echo "Source directory does not exist."
  exit 1
fi