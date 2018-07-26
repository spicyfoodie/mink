

input = getDirectory("Input directory");
list = getFileList(input);
file_index=0;
for (i = 0; i < list.length; i++) 
	{
	if(endsWith(list[i], '.roi'))
		{	file_index=file_index+1;
		roiManager("Open", input+list[i]);	
		convert_roi_table(input,list[i]);	
		roiManager("Deselect");
		roiManager("Delete");
		}
	if(endsWith(list[i], '.zip'))
		{	file_index=file_index+1;
		roiManager("Open", input+list[i]);	
		convert_roi_table(input,list[i]);	
		roiManager("Deselect");
		roiManager("Delete");
		}
	}

function convert_roi_table(folder,filename)
{
filename1=substring(filename,0,lengthOf(filename)-4);
newImage("Untitled", "8-bit black", 256, 256, 1);
nroi=roiManager("count");
//print(folder+filename+"_roi.txt");
f = File.open(folder+filename1+"_roi.txt"); 
for (j=0;j<nroi;j++)
{	roiManager("select", j)	
	Roi.getCoordinates(x,y);
	str1=Roi.getName;
	//print(str1);
	n=x.length; 
	s = ""; 
	z = 0; 
	while (z<n) 
		{   s=s+x[z]+","+y[z]+";"; 
		    z++; 
		 } ;
	print(f,str1+" : "+s);
}
selectWindow("Untitled");
close();
File.close(f);
}
