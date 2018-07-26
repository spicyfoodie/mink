
run("Save", "save=D:\\JenuChacko\\mcf\\confluency_calibrations\\temp.tif");

 ///// DRAWING DOESNT LOOK GOOD
//run("Duplicate...", " ");
//setAutoThreshold("Default dark");
//setThreshold(1, 255);
//run("Convert to Mask");

setAutoThreshold("Percentile dark");
setAutoThreshold("Percentile dark");
//setThreshold(96, 255);
run("Convert to Mask");
setForegroundColor(255, 255, 255);