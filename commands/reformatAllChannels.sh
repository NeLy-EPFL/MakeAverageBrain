#!/bin/bash

REFBRAIN='vnc_template'
AYMANNSROOT='/home/aymanns'
REGROOT="$AYMANNSROOT/RegisterOtdFLPo"
MUNGERDIR="/usr/local/bin"
export REGBINDIR="/usr/lib/cmtk/bin"
export PATH="$REGBINDIR:$PATH"

cd $REGROOT
LANG=C "$MUNGERDIR/munger" -b "$REGBINDIR" -a -w -r 010203 -T 12 -X 26 -C 8 -G 80 -R 4 -A '--accuracy 0.4' -W '--accuracy 0.4' -s refbrain/"${REFBRAIN}".nrrd images/g23xf3_vnc
