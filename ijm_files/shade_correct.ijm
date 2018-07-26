

stack=getTitle();
run("Duplicate...", "duplicate");
rename("new_stack");
selectWindow(stack);
getDimensions(x,y,c,s,f);
if(f>s)
 s=f;

for(i=1;i<=s;i++)
{	
	//setBatchMode(true);
	selectWindow(stack);
	setSlice(i);
	fn=getInfo("slice.label");
	print(fn);
	run("Duplicate...", "use");
	del_window=getTitle();
	shade_corr();		
	selectWindow(del_window);
	close();
	//wait(500);
	fn1=getTitle();
	run("Subtract Background...", "rolling=50 sliding");		
	
	selectWindow("filt_"+fn);
	run("Select All");
	run("Copy");
	
	selectWindow("new_stack");
	setSlice(i);
	run("Paste");

	selectWindow("filt_"+fn);	
	close();
	
	//setBatchMode("False");
}
run("8-bit");

function shade_corr()
{
	fn=getTitle();
	run("Enhance Contrast", "saturated=0.35");
	run("Duplicate...", "title=temp_shading");
	selectWindow(fn);
	run("Duplicate...", "title=temp_blur");
	run("Gaussian Blur...", "sigma=10");
	imageCalculator("Divide create 32-bit", "temp_shading","temp_blur");
	rename("filt_"+fn);
	selectWindow("temp_blur");
	close();
	selectWindow("temp_shading");
	close();
}