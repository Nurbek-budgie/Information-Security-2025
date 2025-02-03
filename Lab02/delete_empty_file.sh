#!/bin/bash

directory=$1

# Check if the given argument is a valid directory
if [ ! -d "$directory" ]; then
    echo "Error: '$directory' is not a valid directory."
    exit 1
fi

empty_files=&(find "$directory" -type f -empty)

echo "DELETING THE FILE I FOUND!!! WARNING"
echo "$empty_files"
find "$directory" -type f -empty -delete
echo "complete $(whoami)!"
