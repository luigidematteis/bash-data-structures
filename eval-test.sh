#!bin/bash

command1='echo "Hello world, welcome Luigi"'
eval $command1 | grep -e "Hello" -e "Luigi"
