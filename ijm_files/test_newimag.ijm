

fn1=getTitle();
selectWindow(fn1);
run("Duplicate...", "title=FAD duplicate channels=1");
selectWindow(fn1);
run("Duplicate...", "title=NADH duplicate channels=2");

selectWindow("FAD");
roiManager("Select", 0);
run("Duplicate...", "duplicate");
make_avg();
selectWindow("FAD-1");
close();

selectWindow("NADH");
roiManager("Select", 0);
run("Duplicate...", "duplicate");
make_avg();
selectWindow("NADH-1");
close();

imageCalculator("Divide create 32-bit stack", "NADH","NADH-1_bkg");
selectWindow("Result of NADH");
rename("norm_NADH");

imageCalculator("Divide create 32-bit stack", "FAD","FAD-1_bkg");
selectWindow("Result of FAD");
rename("norm_FAD");

selectWindow("NADH-1_bkg");
close();
selectWindow("FAD-1_bkg");
close();

imageCalculator("Divide create 32-bit stack", "norm_NADH","norm_FAD");
selectWindow("Result of norm_NADH");
rename("redox_Image");

selectWindow("norm_NADH");
close();
selectWindow("norm_FAD");
close();

selectWindow("redox_Image");
make_avg();


function make_avg()
{
fn=getTitle();
run("Plot Z-axis Profile");
Plot.getValues(x,y);
close();
//Array.show(y);
selectWindow(fn);
newImage(fn+"_bkg", "32-bit black", 512, 512, 34);
run("Add...", "value=1 stack");
for(j=0;j<34;j++)
{ 
	//print(y[j]);
	setSlice(j+1);
	run("Multiply...", "value="+parseInt(y[j])+" slice");
	//wait(500);
}
//print('done');
//run("Plot Z-axis Profile");

}