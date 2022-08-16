#!/bin/bash
declare -A tree
declare ROWS=63
declare COLUMNS=100
declare Y_SIZE=16

# read input

#--- Create default grid
for i in $(seq 1 $ROWS); do
	for j in $(seq 1 $COLUMNS); do
		tree[$i,$j]="_"
	done
done

#---
startRow=$ROWS
let center=$COLUMNS/2
declare -a centers
centers+=( "$center" )
iterator=0
iteratorCenter=0
findCenter () {
    for c in ${centers[@]}; do
        let left=$c-$Y_SIZE
        let right=$c+$Y_SIZE
        centers+=( "$left" )
        centers+=( "$right" )
    done
    for s in $(seq 0 $iterator); do
        unset centers[$s]
    done
    for e in ${centers[@]}; do
        let iterator++
        let iteratorCenter++
    done
}

buildBranch () {
    for k in $(seq 1 $Y_SIZE); do
        for c in ${centers[@]}; do 
            tree[$startRow,$c]="1"
        done
        let startRow-=1
    done
    for c in ${centers[@]}; do 
        let branch_left=$c-1
        let branch_right=$c+1
        for k in $(seq 1 $Y_SIZE); do
            tree[$startRow,$branch_left]="1"
            tree[$startRow,$branch_right]="1"
            let branch_left-=1
            let branch_right+=1
            let startRow-=1
        done
        if [[ "$iteratorCenter" -gt "0" ]]; then
            let startRow=$startRow+$Y_SIZE
        fi
        let iteratorCenter--
    done
    
    findCenter
    let Y_SIZE=$Y_SIZE/2
}

buildBranch
buildBranch
buildBranch
buildBranch
buildBranch


#---   

#---Display grid
for i in $(seq 1 $ROWS); do
	for j in $(seq 1 $COLUMNS); do
		echo -ne ${tree[$i,$j]}
	done
	echo
done
echo