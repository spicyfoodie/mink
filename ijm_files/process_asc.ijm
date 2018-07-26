//print(lut_name);
input = getDirectory("Input directory");
list = getFileList(input);
file_index=0;
for (i = 0; i < list.length; i++) 
	{
		if(endsWith(list[i], 'ns.asc'))
		{	
			nroi=roiManager("count");
			if (nroi>1)
			{
				roiManager("Deselect");
				roiManager("Delete");
			}
			
			run("Text Image... ", "open=["+input+list[i]+"]");
			photons=getTitle();
			tm=replace(photons, "photons", "color coded value");
			run("Text Image... ", "open=["+input+tm+"]");
			//run("16_colors");
			run("Enhance Contrast", "saturated=0.35");	
			selectWindow(photons);
			setAutoThreshold("Yen dark");
			setOption("BlackBackground", true);
			run("Convert to Mask");
			run("Close-");
			run("Close-");
			setOption("BlackBackground", true);
			run("Dilate");
			run("Close-");
			run("Fill Holes");
			run("Analyze Particles...", "size=100-Infinity add in_situ");	
			selectWindow(tm);
			
			nroi=roiManager("count");
			if (nroi>1)
			{
				roiManager("multi-measure measure_all append");
			}
			
			headings = split(String.getResultsHeadings);
			row=nResults;
	for (col=0; col<lengthOf(headings); col++)
			setResult(headings[col], row, "--");
			updateResults;			
			selectWindow(tm);
			close();
			selectWindow(photons);
			close();			
		}
	}
