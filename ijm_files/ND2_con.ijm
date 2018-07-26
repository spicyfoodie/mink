
// copy this ijm in any folder and open the ijm from macro window and run it.
// converts all the nd2 to imagej tiff in that folder 
// folders need  "//" 

function nd2tiff(output,filename) {
	if (endsWith(filename,"nd2")){ 
	run("Bio-Formats Importer", "open=H:\\RICS\\pxn-E5\\"+filename+" color_mode=Default view=Hyperstack stack_order=XYCZT");
	run("Save", "save=H:\\RICS\\pxn-E5\\"+filename+".tif");
	run("Close");

	}
}


input=File.directory;
output=File.directory;
setBatchMode(true);
list=getFileList(input);
for(i=0;i<list.length;i++)
	nd2tiff(output,list[i]);
setBatchMode(false);
