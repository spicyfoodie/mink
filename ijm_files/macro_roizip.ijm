
getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);
//day and month are on list index- 0 to 11 or 0 to 6
//print(d2s(year,0)+d2s(month+1,0));
timestring= "-"+d2s(year,0) + d2s(month+1,0) + d2s(dayOfMonth,0)+"-"+d2s(hour,0) + d2s(minute,0)+"-" + d2s(second,0) ;

foldername="";
file_index=roiManager("count");
fn=getTitle();
//print(fn);
run("Duplicate...", " ");
rename('temp');
setAutoThreshold("Huang dark");
setOption("BlackBackground", false);
run("Convert to Mask");		
run("Watershed");					
run("Analyze Particles...", "size=100-Infinity add");
selectWindow('temp');
run("Close");

// making them together
selectWindow(fn);	
nroi=roiManager("count");
indexes=Array.getSequence(nroi);			
indexes=Array.slice(indexes,file_index,nroi);
roiManager("select", indexes);
roiManager("Combine");
roiManager("Add");	
nroi=roiManager("count");
roiManager("Select",nroi-1);
roiManager("Rename", "masked_image");

// make xor mask
selectWindow(fn);
//whole image	
run("Select All");
roiManager("Add");
nroi=roiManager("count");
roiManager("Select",nroi-1);
roiManager("Rename", "whole_image");

nroi=roiManager("count");
indexes=Array.getSequence(nroi);			
indexes=Array.slice(indexes,nroi-3,nroi);
roiManager("Select",indexes);
roiManager("XOR");
roiManager("Add");
nroi=roiManager("count");
roiManager("Select",nroi-1);
roiManager("Rename", "residual_image");


if (foldername=="")
	{
		File.makeDirectory("C:/roi_save/"); 
		
		roiManager("Save",  "C:/roi_save/"+fn+timestring+".zip");
		print("saving in C DRIVE-> C:/roi_save/"+fn+timestring+".zip");
	}
else
	{
		splitDir= foldername + "/roi_save/"; 	
		File.makeDirectory(splitDir); 
		roiManager("Save",  splitDir+fn+timestring+".zip");
		print(splitDir+fn+timestring+".zip");
	}


// select the masked image and save that roi separately as a .zip nor .roi!!! 
nroi=roiManager("count");
roiManager("select", nroi-3);
rename(fn);
if (foldername=="")
	roiManager("Save",  "C:/roi_save/"+fn+".zip");	
else
	roiManager("Save",  splitDir+fn+".zip");

indexes=Array.getSequence(nroi);			
indexes=Array.slice(indexes,file_index,nroi);
roiManager("select", indexes);
roiManager("deselect");
roiManager("Delete");	
	 
selectWindow(fn);
run("Select None");


