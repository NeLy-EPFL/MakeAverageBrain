Installing nat package for R
----------------------------

Save the following lines in ~/.R/Makevars
CC=icc
CXX=icpc
FC=ifort
F77=ifort
CFLAGS += -D_BSD_SOURCE -D_POSIX_C_SOURCE=200809L

In R run:
install.packages("devtools")
devtools::install_github("jefferis/nat")

Download CMTK tar and extract it in home directory


Loading nessecassy modules
--------------------------
This step should be done automatically by the makeAverageBrain command.
The required module is fftw compiled with openmp. To be able to load that
module gcc has to be loaded first.
