fn=getTitle();
getDimensions(x,y,t,s,d);
print(x,y,t,s,d);
//setBatchMode(true);
//print(fn);

for(i=0;i<s;i++)

{   //print(fn,parseInt(i));
	selectWindow(fn);
	//print(fn);
	setSlice(i+1);
	//getInfo('name');
	
	run("Duplicate...","title=dup");
	rename('dup');

	run("Duplicate...","title=dup2");
	rename('dup2');
	//wait(1000);
	run("Gaussian Blur...", "sigma=10");
	//wait(1000);
	imageCalculator("Divide create 32-bit", "dup","dup2");
	rename(d2s(i,0));
	selectWindow('dup');
	close();
	selectWindow('dup2');
	close();
	wait(200);
	//selectWindow("Result of 20R-1.tif");
	
}

run("Images to Stack");
rename(fn+"_shaded");
run("Enhance Contrast", "saturated=0.35");


