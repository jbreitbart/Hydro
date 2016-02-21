#!/bin/sh +x

export OMP_NUM_THREADS=${1}

rm output/time-hydro-"${1}".txt
touch output/time-hydro-"${1}".txt

for i in {0..9}
do
    start="`date +%s.%N`"
    mpirun -configfile mpiconfig
    stop="`date +%s.%N`"
    echo "${stop} - ${start}" | bc -l >> output/time-hydro-${1}.txt
done
