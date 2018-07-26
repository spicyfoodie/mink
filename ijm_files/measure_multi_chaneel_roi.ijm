run("Set Measurements...", "area mean standard modal integrated median stack redirect=None decimal=3");
//print (nSlices);
setOption("Stack position", true);
j=0;
for (n=1; n<=nSlices; n=n+2) 
{
	roiManager("select",j);
	j=j+1;
	print(j,n);
  setSlice(n);
  run("Measure");
  wait(200);// comment this line to go faster
}

// for channel 2, NADH
j=0;
for (n=2; n<=nSlices; n=n+2) 
{	//print(j,n);
	
	roiManager("select",j);
	j=j+1;
	
  setSlice(n);
  run("Measure");
  wait(200); // comment this line to go faster
}
