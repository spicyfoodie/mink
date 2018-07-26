

getDimensions(x,y,t,s,d);
for (i=1;i<s+1;i++)
{	//print(i);
	//wait(1000);
	setSlice(i);	
	
	//// for plated
	run("PHANTAST", "sigma=4 epsilon=0.03 do compute selection");
	
	//// f0r suspension
	//run("PHANTAST", "sigma=5 epsilon=0.1 do compute selection");

	/// for polscope -10x
	//run("PHANTAST", "sigma=5 epsilon=0.02 do compute selection");
	//
}

//run("Make Montage...", "columns=3 rows=3 scale=0.25");
//run("PHANTAST", "sigma=3 epsilon=0.02 do compute selection");
