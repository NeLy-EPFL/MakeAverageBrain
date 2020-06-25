function convertToNrrd(file_path, output_folder){
	open(file_path);
    file_name = File.nameWithoutExtension;
    sub_folder = output_folder + "/" + file_name;
    File.makeDirectory(sub_folder);
	name = getTitle();
    getDimensions(w, h, channels, slices, frames);
	run("Split Channels");
    if(channels == 3){
	selectWindow("C2-" + name);
	run("Nrrd ... ", "nrrd=" + sub_folder + "/" + substring(name, 0, lengthOf(name) - 4) + "_01.nrrd");
	selectWindow("C3-" + name);
	run("Nrrd ... ", "nrrd=" + sub_folder + "/" + substring(name, 0, lengthOf(name) - 4) + "_02.nrrd");
	selectWindow("C1-" + name);
	run("Nrrd ... ", "nrrd=" + sub_folder + "/" + substring(name, 0, lengthOf(name) - 4) + "_03.nrrd");
	close();
	close();
	close();
    }
    else if(channels == 2){
	    selectWindow("C2-" + name);
	    run("Nrrd ... ", "nrrd=" + sub_folder + "/" + substring(name, 0, lengthOf(name) - 4) + "_01.nrrd");
	    selectWindow("C1-" + name);
	    run("Nrrd ... ", "nrrd=" + sub_folder + "/" + substring(name, 0, lengthOf(name) - 4) + "_02.nrrd");
	    close();
	    close();
    }
    else if(channels == 1){
        run("Nrrd ... ", "nrrd=" + sub_folder + "/" + substring(name, 0, lengthOf(name) - 4) + ".nrrd");
        close();
    }
}

files = newArray("/media/lab_server/AYMANNS_Florian/Experimental_data/confocal_data/g23xf3_vnc.lsm",
                 "/media/lab_server/AYMANNS_Florian/Experimental_data/confocal_data/g23xf3_asdf.lsm")

setBatchMode(true);

for(i = 0; i < files.length; i++)
	convertToNrrd(files[i],
			  	  "images/g23xf3_brain");

setBatchMode(false);
