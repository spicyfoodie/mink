
run("Close All");
input = getDirectory("Input directory");
list = getFileList(input);
file_index=0;
for (i = 0; i < list.length; i++) 
	{if(endsWith(list[i], 'photons.asc'))
		{	file_index=file_index+1;
		}}

file_count=0;// index and count are reveresed !! my bad

run("Set Measurements...", "area mean standard modal integrated median redirect=None decimal=3");
for (i = 0; i < list.length; i++) 
	{
		if(endsWith(list[i], 'photons.asc'))
		{	st=list[i];
			a1=substring(st,0,indexOf(st,"_photons.asc"))+"_a1.asc";
			t1=substring(st,0,indexOf(st,"_photons.asc"))+"_t1.asc";
			t2=substring(st,0,indexOf(st,"_photons.asc"))+"_t2.asc";
			a2=substring(st,0,indexOf(st,"_photons.asc"))+"_a2.asc";
			//a1p=substring(st,0,indexOf(st,"_photons.asc"))+"_a1[_].asc";
			//a2p=substring(st,0,indexOf(st,"_photons.asc"))+"_a2[_].asc";			
			
			run("Text Image... ", "open=["+ input+list[i] + "]");
			//print(list[i]);	
			showProgress(file_count/file_index);				
			get_roi(input,list[i]); // uses photons.asc to make masks on entropy and saves mask as imageJ-tiff
			wait(10);
			selectWindow("Results");
			//IJ.renameResults(list[i]);	
			saveAs("Results", input+list[i] +".xls");
			selectWindow("Results");
			run("Close");

			run("Text Image... ", "open=["+ input+a1 + "]");	
			get_results(a1);						
			saveAs("Results", input+ a1+".xls");
			selectWindow("Results");
			run("Close");
			
			run("Text Image... ", "open=["+ input+a2 + "]");	
			get_results(a2);			
			saveAs("Results", input+ a2+".xls");			
			selectWindow("Results");
			run("Close");	
			
			run("Text Image... ", "open=["+ input+t1 + "]");	
			get_results(t1);			
			saveAs("Results", input+ t1+".xls");
			selectWindow("Results");
			run("Close");
			
			run("Text Image... ", "open=["+ input+t2 + "]");	
			get_results(t2);			
			saveAs("Results", input+ t2+".xls");
			selectWindow("Results");
			run("Close");


			roiManager("Delete");		
			file_count=file_count+1;
		}
	}

function get_roi(input,fn)

{			p1=getTitle();
			run("Duplicate...", " ");
			rename("threshold_me");
			run("8-bit");
			setAutoThreshold("MaxEntropy dark");	
			run("Analyze Particles...", "size=100-Infinity add in_situ");
			nROIs = roiManager("count");
			print("Max Entropy");
			print(p1);
			print(nROIs);
			
			min_roi=2;
			if ((nROIs<min_roi)|(nROIs==0))
			{
				if(nROIs>0){ // delete roi from max entropy if any
					
					roiManager("Select All");
					roiManager("Delete");}
					
				print("Otsu");	
				selectWindow("threshold_me");
				close();
				selectWindow(p1);
				run("Duplicate...", " ");
				rename("threshold_me");
				run("8-bit");
				setAutoThreshold("Otsu dark");
				run("Analyze Particles...", "size=100-Infinity add in_situ");
				nROIs = roiManager("count");
					//print(p1);
					//print(nROIs);
					if ((nROIs<min_roi)|(nROIs==0)) 
					{	
						if(nROIs>0){ // delete roi from max entropy if any
							roiManager("Select All");
							roiManager("Delete");	
							}
						print("Default");
						selectWindow("threshold_me");
						close();
						selectWindow(p1);
						run("Duplicate...", " ");
						rename("threshold_me");
						run("8-bit");
						setAutoThreshold("Default dark");
						run("Analyze Particles...", "size=100-Infinity add in_situ");
					}			
				
				}
			selectWindow(p1);	
			run("Select All");
			roiManager("Measure");	
			selectWindow(p1);	
			close();
			selectWindow("threshold_me");
			run("Save", "save=["+input+fn+"Mask.tif]");
			close();	
			roiManager("Save", input+fn+"RoiSet.zip");
		
}

function get_results(fn)

{			p1=getTitle();
			run("Select All");
			roiManager("Measure");	
			selectWindow(p1);	
			close();
			
	}
