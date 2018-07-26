

nroi=roiManager("count");
for(i=0;i<nroi;i++)
{
	roiManager("Select",i);
	run("Measure");
	}