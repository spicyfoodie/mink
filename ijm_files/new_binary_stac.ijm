fn=getTitle();
run("Duplicate...", " ");
rename("dup");
run("Gaussian Blur...", "sigma=10");
imageCalculator("Divide create 32-bit", fn,"dup");
rename("result");
selectWindow("dup");
close();
selectWindow(fn);
close();
selectWindow("result");
rename(fn);
setAutoThreshold("Default dark");
setOption("BlackBackground", false);
run("Convert to Mask");

