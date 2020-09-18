#!/bin/bash

# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'EXITCODE=$?; if [ "${EXITCODE}" -ne 0 ]; then echo "\"${last_command}\" command failed with exit code ${EXITCODE}."; fi' EXIT



# Change this to the folder that holds the confocal images you want to register
REGROOT="/data/aymanns/test_confocal_reg/20190513-2-SS30303-smFP"
# Change this to the name of your lsm file
FILE="20190513-2-SS30303-smFP-brain.lsm"
# Choose the template you want to use e.g. 'vnc_template' or 'brain_template'.
REFBRAIN='brain_template'


MUNGERDIR="/home/confocal_reg/cmtk/build/bin"
export REGBINDIR="/home/confocal_reg/cmtk/build/bin"
export PATH="$REGBINDIR:$PATH"

IMAGEDIR="${REGROOT}/images"
mkdir $IMAGEDIR

/opt/Fiji.app/ImageJ-linux64 --ij2 --headless --console --run /home/confocal_reg/MakeAverageBrain/cli_convert_to_nrrd.ijm 'file="'${REGROOT}/${FILE}'",folder="'${IMAGEDIR}'"'

cd $REGROOT
LANG=C "$MUNGERDIR/munger" -b "$REGBINDIR" -a -w -r 010203 -T 24 -X 26 -C 8 -G 80 -R 4 -A '--accuracy 0.4' -W '--accuracy 0.4' -s /home/confocal_reg/MakeAverageBrain/refbrain/"${REFBRAIN}".nrrd .

rm -r "${IMAGEDIR}"
