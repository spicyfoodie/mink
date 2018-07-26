run("Set Measurements...", "mean modal integrated median stack redirect=None decimal=3");

getDimensions(x,y,z,c,d);


for (i=1;i<z+1;i++)
{

setSlice(i);
run("Measure");
	
}
