#!/bin/bash
#SBATCH -p debug
#SBATCH --workdir /home/aymanns/MakeAverageVNC/jobs
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 28
#SBATCH --mem 64G
#SBATCH --time 01:00:00

ml load gcc/7.3.0
ml load fftw/3.3.7-openmp

# passed REFBRAIN REGROOT REGBINDIR and MUNGERDIR variables
REFBRAIN='refVNC-6-symmetric'
AYMANNSROOT="/home/aymanns"
REGROOT="$AYMANNSROOT/MakeAverageVNC"
MUNGERDIR="$AYMANNSROOT/usr/local/bin"
export REGBINDIR="$AYMANNSROOT/usr/local/bin"
export PATH="$REGBINDIR:$PATH"

cd $REGROOT
LANG=C "$MUNGERDIR/munger" -b "$REGBINDIR" -a -w -r 010203 -T 28 -X 26 -C 8 -G 80 -R 4 -A '--accuracy 0.4' -W '--accuracy 0.4' -s refbrain/"${REFBRAIN}".nrrd images
