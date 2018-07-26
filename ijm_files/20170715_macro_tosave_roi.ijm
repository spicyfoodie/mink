
newImage("Untitled", "8-bit black", 1024, 1024, 1);
nroi=roiManager("count");
//print(nroi);

f = File.open("C:/Users/Jenu Chacko/Documents/_____Q_coding/ipython_files/imagej_roi/table.txt"); 
for (j=0;j<nroi;j++)
{	roiManager("select", j)	
	Roi.getCoordinates(x,y);
	str1=Roi.getName;
	//print(str1);
	n=x.length; 
	s = ""; 
	z = 0; 
	while (z<n) 
		{   s=s+x[z]+","+y[z]+"    "; 
		    z++; 
		 } ;
	print(f,str1+" : "+s);
}