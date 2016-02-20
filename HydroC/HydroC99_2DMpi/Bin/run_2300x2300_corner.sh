#!/bin/sh

RUNDIR=${HOME}/ptmp/Github/HydroC/HydroC99_2DMpi
EXEDIR=${PWD}/../Src/
INPDIR=${PWD}/../../../Input
#RUNCMD="ccc_mprun -p standard -n 1 -N 1 -x -T36000"
RUNCMD="mpirun -np 1 -genv I_MPI_FABRICS shm -bootstrap ssh"

mkdir -p ${RUNDIR}
cd ${RUNDIR}
rm -rf Dep

${RUNCMD} ${EXEDIR}/hydro -i ${INPDIR}/input_23000x23000_corner.nml 

#EOF
