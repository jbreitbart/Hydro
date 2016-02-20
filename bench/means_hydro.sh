#!/bin/bash

for ((i=1;i<33;i++))
do
    lama_threads="$i"

    num=0
    sum=0
    for line in $(cat output/time-hydro-$lama_threads.txt)
    do
       sum=`echo "$sum+$line" | bc -l`
       num=$((num+1))
    done
    if [ $num -ne 0 ]
    then
        p=`echo "$sum/$num" | bc -l`
        echo "Hydro $lama_threads:	$p"
    fi
done

