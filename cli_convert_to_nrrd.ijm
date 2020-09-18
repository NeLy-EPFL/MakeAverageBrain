#@String file
#@String folder

function convertToNrrd(file_path, output_folder){
    open(file_path);
    file_name = File.nameWithoutExtension;
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
    else if(channels == 1){
        run("Nrrd ... ", "nrrd=" + output_folder + "/" + substring(name, 0, lengthOf(name) - 4) + ".nrrd");
        close();
    }
}
convertToNrrd(file, folder);
