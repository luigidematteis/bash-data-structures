#!bin.bash
read x
read y
let expr1=$x+$y
let expr2=$x-$y
let expr3=$x*$y
let expr4=$x/$y
echo $expr1
echo $expr2
echo $expr3
echo $expr4
