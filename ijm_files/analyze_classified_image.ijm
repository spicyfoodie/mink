setThreshold(0, 0);
run("Convert to Mask", "method=Default background=Dark");
run("Analyze Particles...", "size=200-Infinity pixel add stack");
roiManager("Show None");