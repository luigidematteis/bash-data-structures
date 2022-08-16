#!bin/bash
read list_size
tot_average=0
declare -a numbers_list
for i in $(seq 1 $list_size); do
    read number
    numbers_list+=("$number")
done
#Compute average
function computeAverage() {
    for x in ${numbers_list[@]}; do
        let tot_average+=$x
    done
}
computeAverage
printf "%.3f\n" $(bc -l <<< "$tot_average / $list_size")