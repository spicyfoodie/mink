
function get_lp()
{roiManager("select", 0)
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
	Array.show(L);
	return L;	
	
	}
	

x=get_lp();
//print(lengthOf(x));
print(x[1:10]);
