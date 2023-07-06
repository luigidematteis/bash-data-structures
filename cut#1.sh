#!/bin/bash
readarray -t LINES

for element in "${LINES[@]}"; do
    char2=$(printf "$element" | cut -c 2)
    char7=$(printf "$element" | cut -c 7)
    echo "${char2}${char7}"
done
