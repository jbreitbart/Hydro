#!/bin/bash -x

# Helper script for running hydro

mkdir -p output

for ((threads=1;threads<33;threads++))
do
    /work/clustsafe --host 192.168.0.217 --user admin -P admin -a energy --reset >/dev/null
    perf stat -a -e power/energy-pkg/,power/energy-cores/,power/energy-ram/ ./hydro_run.sh "${threads}" 2>output/temp.txt
    tac output/temp.txt |grep -m 4 . |tac > output/hydro-rapl-energy-${threads}.txt
    /work/clustsafe --host 192.168.0.217 --user admin -P admin -a energy --reset |grep "4:" | sed s/"    4: "// >output/hydro-clustsafe-energy-${threads}.txt
done

