#!/bin/bash
declare -A tree
declare ROWS=63
declare COLUMNS=100
declare Y_DEFAULT_SIZE=16
read input

for i in $(seq 1 $ROWS); do
	for j in $(seq 1 $COLUMNS); do
		tree[$i,$j]="_"
	done
done

declare startRow=$ROWS
declare node=1
let center=$COLUMNS/2
let branch=$ROWS-$Y_DEFAULT_SIZE
let branch_left=$center-1
let branch_right=$center+1

initializeBranch () {
	tree[$startRow,$center]="1"
	let startRow=startRow-1
}

function buildBranches () {
	tree[$branch,$branch_left]="1"
	tree[$branch,$branch_right]="1"
	let branch_left=$branch_left-1
	let branch_right=$branch_right+1
	let branch=branch-1			
}

for i in $(seq 1 $input); do
	for n in $(seq 1 $node); do
		for k in $(seq 1 $Y_DEFAULT_SIZE); do
			initializeBranch
		done
	done
	let node=$node*2
done

for i in $(seq 1 $ROWS); do
	for j in $(seq 1 $COLUMNS); do
		echo -ne ${tree[$i,$j]}
	done
	echo
done
echo

for i in $(seq 1 $input); do
	for i in $(seq 1 $Y_DEFAULT_SIZE); do
		if [[ "$center_children_left" -ne "0" && "$center_children_right" -ne "0" ]]; then
			tree[$startRow,$center_children_left]="1"
			tree[$startRow,$center_children_right]="1"
			tree[$branchChildren,$children_branch_L_left]="1"
			tree[$branchChildren,$children_branch_R_left]="1"
			tree[$branchChildren,$children_branch_L_right]="1"
			tree[$branchChildren,$children_branch_R_right]="1"
			let startRow=$startRow-1
			let children_branch_L_left=$children_branch_L_left-1
			let children_branch_R_left=$children_branch_R_left-1
			let children_branch_L_right=$children_branch_L_right+1
			let children_branch_R_right=$children_branch_R_right+1
			let branchChildren=$branchChildren-1
			# tree[$branch,$branch_left]="1"
			# tree[$branch,$branch_right]="1"
		else
			branch()
		fi
	done
	let center_children_left=$center-$Y_DEFAULT_SIZE
	let center_children_right=$center+$Y_DEFAULT_SIZE
	let startRow=$startRow-$Y_DEFAULT_SIZE
	let Y_DEFAULT_SIZE=$Y_DEFAULT_SIZE/2
	let branchChildren=$startRow-$Y_DEFAULT_SIZE
	let children_branch_L_left=$center_children_left-1
	let children_branch_L_right=$center_children_left+1
	let children_branch_R_left=$center_children_right-1
	let children_branch_R_right=$center_children_right+1
done