
function get_lp()
{
	roiManager("select", 0)
	Roi.getCoordinates(xpoints, ypoints);
	//Array.show(xpoints);
	//Array.show(ypoints);
	for(j=0;j<lengthOf(xpoints);j++)
		{ 
		xpoints[j]=round(xpoints[j]);
		ypoints[j]=round(ypoints[j]);
		}
	Array.getStatistics(xpoints,xmin,xmax,xm,xs);
	Array.getStatistics(ypoints,ymin,ymax,ym,ys);
	
	if (ys>xs)
		{
			len=abs(ypoints[1]-ypoints[0]);
			dx=(xmax-xmin)/len;
			X=newArray(len);
			Y=newArray(len);
			for(i=0;i<len;i++)
				{ //print(round(xmin+(i*dx)),ymin+i);
					X[i]=round(xmin+(i*dx));
					Y[i]=ymin+i ;
				}
			}
		else
		{	len=abs(xpoints[1]-xpoints[0]);
			X=newArray(len);
			Y=newArray(len);
			dy=(ymax-ymin)/len;
			for(i=0;i<len;i++)
				{//print(xmin+i,round(ymin+(i*dy)));
					Y[i]=round(ymin+(i*dy));
					X[i]=xmin+i ;
				}
			}
	L=Array.concat(len,X);
	L=Array.concat(L,Y);
	//Array.show(L);
	return L;	
	
	}
	

	


im=getTitle();
//print(im);
getDimensions(width, height, channels, slices, frames);

L=get_lp();
len=L[0];

newImage("test","32-bit",len+1,frames+1,1);

X=Array.slice(L,1,len+1);
Y=Array.slice(L,len+1,len+len+1);
//print(len);
print(len,frames);
for(i=1;i<frames;i++)
	{
	selectWindow(im);
	setSlice(i);
	//run("Plot Profile");
	//Plot.getValues(x,y);
	//close();
	//Array.show(y);
	for(j=0;j<len;j++)
		{
			selectWindow(im);
			p=getPixel(X[j],Y[j]);
			//print(X[j],Y[j],p);
			selectWindow('test');
			//print(y[j]);
			setPixel(j+1,i+1,p);
			
			}	
	//close();
	}