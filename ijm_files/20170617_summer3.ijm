input = getDirectory("Input directory");
//input="G:\pancreas_\FRESH___\\freeze_bites\\"
list = getFileList(input);
file_count=0;

for (i = 0; i < list.length; i++) 
	{
		if(endsWith(list[i], '.sdt'))
		{	
			file_count=file_count+1;
		}
	}
print(" Number of sdt files = ", file_count);

newImage("Exp_plots","32-bit",file_count,256,1);
file_index=0;
for (i = 0; i < list.length; i++) 
	{
		if(endsWith(list[i], '.sdt'))
		{	
			run("Bio-Formats (Windowless)", "open="+input+list[i]);
			print(list[i]);
			t1=getTitle();
			run("Z Project...", "projection=[Sum Slices]");
			run("16_colors");
			run("Enhance Contrast", "saturated=0.35");	
			rename("zp");	
			selectWindow(t1);
			run("Plot Z-axis Profile");
			Plot.getValues(x,y);
			close();
			//Array.show(y);			
			
			
			for (j=1;j<=256;j++)
			{	//print(file_index,j,y[j-1]);
				selectWindow("Exp_plots");
				setPixel(file_index,j,y[j-1]);
				}
			file_index=file_index+1;
			selectWindow(t1);	
			close();
			selectWindow("zp");
			//run("Save", "save="+input+t1+"_.tif");
			saveAs("Jpeg", input+t1+"_.jpg");
			wait(10);
			close();
		}
	}
selectWindow("Exp_plots");	
save('exp_cruve.tiff');
saveAs("Text Image",input+"exp_data.txt");
