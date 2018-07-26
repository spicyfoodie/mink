
nroi=roiManager("count");
for (i=0;i<nroi;i++)
{
	roiManager("Select",i);
	//setSlice(55*3+i+1);
	
	name=Roi.getName();
	x=split(name,"-");
	//Array.show(x);
	sli=parseInt(x[0]);

	if(sli>195)
		sli=sli-2;
	else
		sli=sli-1;
	setSlice(sli);
	run("Measure");
	
}





//print (Roi.getProperty("Slice"));
//print (x,y,w,h);
//name= call("ij.plugin.frame.RoiManager.getName", 2);
//print(name);
//print(Roi.getProperties());

