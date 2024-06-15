#!/bin/bash

directory="$(pwd)"
regex="\+\d{1,2}\s?\(\d{3}\)\s?\d{3}-\d{4}"

echo "Files in directory:"
ls "$directory"

for file in "$directory"/*.txt; do
    if [ -r "$file" ]; then
        match=$(egrep -n -m 1 "$regex" "$file")  #used egrep as it supports some advanced regex features
        if [ -n "$match" ]; then
            echo "$file:"
            echo "match = line $match"
        fi
    fi
done
