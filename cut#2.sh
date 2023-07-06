#!/bin/bash
readarray -t LINES 

for element in "${LINES[@]}"; do
    string=$(printf "$element" | cut -c 2-7)
    echo "$string"
done
