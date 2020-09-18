If there is an installation on the workstation you are using already by another user, there is no need to install it again.
Just copy their `register_confocal_image.sh` and you can use the same installation.

R
=
`install.packages("devtools")`
`devtools::install_github("jefferis/nat")`
Note: You might have to install some additional libraries using apt if R throws errors when you try to install devtools.

CMTK
====
CMTK should be installed from source.
1. Download source code tar ball.
2. `mkdir ~/cmtk`
3. `cd ~/cmtk`
4. `tar -xzvf ~/CMTK-3.3.1-Source.tar.gz` (change version number as needed)
5. `mv cmtk-3.3.1 core`
6. `mkdir build`
7. Make sure your build includes third-party contributions. Open `core/CMakeLists.txt` and search for BUILD_CONTRIB or contrinbutions and change `OFF` to `ON`.
8. Make sure your build includes munger. Open `core/contrib/CMakeLists.txt` change `OFF` to `ON` for the munger script. (If you don't know whether perl is installed or not you can check with `sudo apt install perl`.)
9. `cd build`
10. `cmake -C ../core/config/gcc-x86_64-sse.cmake ../core/`
11. `make`

Fiji
====
Make sure fiji is installed and change the path to the executable in `register_confocal_image.sh` if necessary.
It is set to `/opt/Fiji.app/ImageJ-linux64`.

Absolut paths
=============
Change the `MUNGERDIR` and `REGBINDIR` variables if needed to matche the location of your cmtk installation.
If you followed the steps above to install CMTK you will only have to change `confocal_reg` to your username.
