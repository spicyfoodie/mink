input = getDirectory("Input directory");
list = getFileList(input);
file_index=0;
for (i = 0; i < list.length; i++) 
	{
		if(endsWith(list[i], '.sdt'))
		{	
			run("Bio-Formats (Windowless)", "open="+input+list[i]);
			t1=getTitle();
			run("Z Project...", "projection=[Sum Slices]");
			run("16_colors");
			run("Enhance Contrast", "saturated=0.35");	
			saveAs("Jpeg", input+t1+"_.jpg");
			close();
			close();
		}
	}
