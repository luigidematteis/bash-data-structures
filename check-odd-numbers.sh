#!bin/bash

for i in {1..99}; do
	echo "Check if number $i is odd: "
	let a=$i%2
	if [[ "$a" -ne "0" ]]; then
		echo "Number $i is odd."
		echo
	else
		echo "Number $i is not odd"
		echo
	fi
done
