
im=getTitle();

newImage("test","32-bit",55,135,1);

for(i=1;i<132;i++)
{
	selectWindow(im);
	setSlice(i);
	run("Plot Profile");
	Plot.getValues(x,y);
	close();
	//Array.show(y);
	for(j=0;j<lengthOf(y);j++)
{
	selectWindow('test');
	//print(y[j]);
	setPixel(j+1,i+1,y[j]);
	
	}

	
	//close();
	}