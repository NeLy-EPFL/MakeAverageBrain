function convertToNrrd(file_path, output_folder){
	open(file_path);
	name = getTitle();
    getDimensions(w, h, channels, slices, frames);
	run("Split Channels");
    if(channels == 3){
	selectWindow("C2-" + name);
	run("Nrrd ... ", "nrrd=" + output_folder + "/" + substring(name, 0, lengthOf(name) - 4) + "_01.nrrd");
	selectWindow("C3-" + name);
	run("Nrrd ... ", "nrrd=" + output_folder + "/" + substring(name, 0, lengthOf(name) - 4) + "_02.nrrd");
	selectWindow("C1-" + name);
	run("Nrrd ... ", "nrrd=" + output_folder + "/" + substring(name, 0, lengthOf(name) - 4) + "_03.nrrd");
	close();
	close();
	close();
    }
    else if(channels == 2){
	    selectWindow("C2-" + name);
	    run("Nrrd ... ", "nrrd=" + output_folder + "/" + substring(name, 0, lengthOf(name) - 4) + "_01.nrrd");
	    selectWindow("C1-" + name);
	    run("Nrrd ... ", "nrrd=" + output_folder + "/" + substring(name, 0, lengthOf(name) - 4) + "_02.nrrd");
	    close();
	    close();
    }
}

files = newArray("/mnt/data/Ascending_Project/R66C01/Confocal/Raw_data/20190130-1-R66C01-nGFP-caax/20190130-1-R66C01-nGFP-caax-brain.lsm",
				 "/mnt/data/Ascending_Project/R66C01/Confocal/Raw_data/20190130-2-R66C01-nGFP-caax/20190130-2-R66C01-nGFP-caax-brain.lsm",
				 "/mnt/data/Ascending_Project/R31C06/Confocal/Raw_data/20180507-1-R31C06-GFP/20180507-1-R31C06-GFP-brain.lsm",
				 "/mnt/data/Ascending_Project/R15E08/Confocal/Raw_data/20180514-2-R15E08-GFP/20180514-2-R15E08-GFP-brain.lsm",
				 "/mnt/data/Ascending_Project/R87H02/Confocal/Raw_data/20180504-1-R87H02-GFP/20180504-1-R87H02-GFP-brain.lsm")

setBatchMode(true);

for(i = 0; i < files.length; i++)
	convertToNrrd(files[i],
			  	  "/mnt/internal_hdd/aymanns/brain_nrrds");

setBatchMode(false);
