#!/bin/sh +x

numbers="`seq -s , 0 ${1}`"

export KMP_AFFINITY="verbose,scatter"
export OMP_NUM_THREADS=${1}

echo $KMP_AFFINITY
echo $OMP_NUM_THREADS

rm output/time-hydro-"${1}".txt
touch output/time-hydro-"${1}".txt

for i in {0..9}
do
    start="`date +%s.%N`"
    ../hydro -i ../Input/ross.nml
    stop="`date +%s.%N`"
    echo "${stop} - ${start}" | bc -l >> output/time-hydro-${1}.txt
done
