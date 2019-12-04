#!/usr/bin/env bash

#$ -l h_vmem=6G

module load intel intel-mkl
module load r
module load fftw/3.3.8-openmp

NEWREFPATH=$1
SYMREFPATH=$2
AXIS=$3
REGROOT=$4
REGBINDIR=$5

# since we are not qsubbing this any more, should just inherit path of main script
echo "PATH=$PATH"
echo $NEWREFPATH
echo $SYMREFPATH
echo $AXIS
echo $REGROOT
echo $REGBINDIR

cd "$REGROOT/commands"

R --no-save --args ${NEWREFPATH} ${SYMREFPATH} ${AXIS} ${REGBINDIR} < MakeSymmetricStandardBrain.R
