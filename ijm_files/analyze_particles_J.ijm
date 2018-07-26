
stack=getTitle();
selectWindow(stack);
getDimensions(x,y,c,s,f);

for(i=1;i<=s;i++)
{	
	//setBatchMode(true);
	selectWindow(stack);
	setSlice(i);
	fn=getInfo("slice.label");
	run("Duplicate...", "use");
	rename(fn);
	threshold_one_image();
	selectWindow(fn);
	close();
}

function threshold_one_image()
{
	fn=getTitle();
	//run("Duplicate...", "title=full");
	//setAutoThreshold("Huang dark");
	//run("Convert to Mask");
	//add_roi(substring(fn, 0, lengthOf(fn)-20),"Huang_auto_ch2");
	//roiManager("Show None");
	//selectWindow("full");
	//close();
	
	selectWindow(fn);
	run("Duplicate...", "title=two_six");
	//print(get_percentile(90),get_percentile(99));
	setThreshold(get_percentile(86),get_percentile(99.99));
	run("Convert to Mask");
	add_roi(substring(fn, 0, lengthOf(fn)-20),"Huang_90P_ch2");
	roiManager("Show None");
	selectWindow("two_six");
	close();
}

function add_roi(fn,roi_name)
{
	nroi=roiManager("count");	
	run("Analyze Particles...", "size=20-Infinity add");
	if (nroi>0)
		roiManager("Select", Array.slice(Array.getSequence(roiManager("count")),nroi) );
	else
		roiManager("Select", Array.getSequence(roiManager("count")));
	roiManager("Combine");
	roiManager("Add");
	roiManager("Delete");
	roiManager("Select",nroi);
	roiManager("Rename", fn+roi_name);
}


function get_percentile(val)
{
    w = getWidth; 
    h = getHeight; 
    a = newArray(w*h); 
    i = 0; 
    for (y=0; y<h; y++) 
       for (x=0; x<w; x++) 
           a[i++] = getPixel(x,y); 
    Array.sort(a); 
    p= a[floor(val*w*h/100)];
	return(p);
}