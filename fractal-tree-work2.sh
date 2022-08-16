#!/bin/bash
declare -A tree
declare ROWS=63
declare COLUMNS=100
declare Y_SIZE=16

read input
#--- Create default grid
for i in $(seq 1 $ROWS); do
	for j in $(seq 1 $COLUMNS); do
		tree[$i,$j]="_"
	done
done

#---

#--- 1. Inizialize branch
declare startRow=$ROWS
let center=$COLUMNS/2

initializeBranch () {
	tree[$startRow,$center]="1"
    let startRow=startRow-1
}

for k in $(seq 1 $Y_SIZE); do
	initializeBranch
done

# 2. Define an array with the start point for next branches
declare -A branchStartRows
branchStartRow+=("$startRow")

# 3. Subdivide previous branch in 2 branches
function buildBranches () {
	tree[$branchStartPoint,$branch_left]="1"
	tree[$branchStartPoint,$branch_right]="1"
}

function build () {
    for e in ${branchStartRow[@]}; do
        branchStartPoint=$e
        let branch_left=$center-1
        let branch_right=$center+1
        count=0
        for k in $(seq 1 $Y_SIZE); do
            buildBranches
            let branch_left-=1
            let branch_right+=1
            let branchStartPoint-=1
            let count++
        done
    let branchStartPoint=$branchStartPoint-count
    # To delete element in array:
    # branchStartRow=("${branchStartRow[@]/$e}")
    branchStartRow+=("$branchStartPoint")
    done
    build
}

for e in ${branchStartRow[@]}; do
    branchStartPoint=$e
    let branch_left=$center-1
    let branch_right=$center+1
    count=0
    for k in $(seq 1 $Y_SIZE); do
	    buildBranches
        let branch_left-=1
        let branch_right+=1
        let branchStartPoint-=1
        let count++
    done
    let branchStartPoint=$branchStartPoint-count
    # To delete element in array:
    # branchStartRow=("${branchStartRow[@]/$e}")
    branchStartRow+=("$branchStartPoint")
done

for e in ${branchStartRow[@]}; do
    echo $e
done

# 4. For each start point, go to point 1
let Y_SIZE=$Y_SIZE/2

#--- 

#---Display grid
for i in $(seq 1 $ROWS); do
	for j in $(seq 1 $COLUMNS); do
		echo -ne ${tree[$i,$j]}
	done
	echo
done
echo