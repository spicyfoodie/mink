
// FOR 5X IMAGES and selection of single 5x5 square area
nroi=roiManager("Count");
if (nroi>0)
{ roiManager("Deselect");
 roiManager("Delete");}
 
run("Duplicate...", " ");
run("Duplicate...", " ");
//setAutoThreshold("Intermodes dark");
setAutoThreshold("Yen dark");
setOption("BlackBackground", false);
run("Convert to Mask");
run("Analyze Particles...", "size=80-Infinity add");

//cellsize=3.14*11*11;
cellsize=121;

run("Set Measurements...", "area redirect=None decimal=3");
//run("Set Measurements...", "area perimeter feret's skewness kurtosis redirect=None decimal=3");
nroi=roiManager("Count");
select_indices=Array.getSequence(nroi);
roiManager("Select",select_indices);
roiManager("Combine");
roiManager("Add");
roiManager("Select", nroi);
roiManager("Multi Measure");
//roiManager("multi-measure measure_all");
//roiManager("Show None");
close();
close();
area1=getResult("Area1", 0);
ncell=area1/166;
print(ncell,area1);




