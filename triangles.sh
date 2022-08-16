#!bin/bash
read x
read y
read z
if [[ "$x" -eq "$y" && "$y" -eq "$z" ]]; then
    echo "EQUILATERAL"
elif [[ "$x" -eq "$y" || "$x" -eq "$z" ]]; then
    echo "ISOSCELES"
elif [[ "$x" -ne "$y" && "$y" -ne "$z" && "$x" -ne "$z" ]]; then
    echo "SCALENE"
fi


