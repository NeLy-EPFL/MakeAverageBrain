Running a registration
======================

Open the `register_confocal_image.sh` file and change the `REGROOT`, `FILE` and `REFBRAIN` variables as needed.
To run the registation use `cd` to navigate to the directory where `register_confocal_image.sh` is located and run `./register_confocal_image.sh`.

If multiple users are using the same workstation, you might want to consider to reduce the number of threads. You can do so by changing the number after `-T` in `register_confocal_image.sh`. 

If the script crashed mid registration, you might have to manually delete the `images` directory it created in `REGROOT` before you can run it again.

NOTE
----
The script will create a directory called `images` in the directory you specify in `REGROOT` and delete this directory when it is done.
If such a folder already exist the script should fail. If you are worried that the script might delete your folder, you should rename it.
