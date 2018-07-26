

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
	ws_analyze_file();
	selectWindow(fn);
	close();
}



function ws_analyze_file()
{
				file_index=roiManager("count");
				fn=getTitle();
				//print(fn);
				run("Duplicate...", " ");
				rename('temp');
				setAutoThreshold("Huang dark");
				setOption("BlackBackground", false);
				run("Convert to Mask");		
				run("Watershed");					
				run("Analyze Particles...", "size=100-Infinity add");
				selectWindow('temp');
				run("Close");
				selectWindow(fn);	
				nroi=roiManager("count");
				indexes=Array.getSequence(nroi);			
				indexes=Array.slice(indexes,file_index,nroi);
				roiManager("select", indexes);
				roiManager("Combine");
				roiManager("Add");	
				nroi=roiManager("count");
				roiManager("deselect");
				roiManager("select", nroi-1);
				roiManager("Rename", substring(fn,0, lengthOf(fn)-4));	
				roiManager("select", indexes);
				roiManager("Delete");		 
				file_index=file_index+1;			
				roiManager("Show None");
				
   }