r= newArray(4);
g= newArray(4);
b= newArray(4);
x= newArray(4);
Array.fill(r,0.5);

for (i=0;i<4;i++)
{
	x[i]=i;
g[i]=random();
b[i]=random();
}

//print(r.length);
Plot.create("RGB Profiles","x", "I"); 
  ymax = 1; 
  Plot.setLimits(0, (r.length-1), 0, ymax); 
  Plot.setColor("red"); 
  Plot.add("line", x, r); 
  Plot.setColor("green"); 
  Plot.add("line", x, g); 
  Plot.setColor("blue"); 
  Plot.add("line", x, b); 
  Plot.update(); 
