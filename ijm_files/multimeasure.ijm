
fn=getTitle();

nroi=roiManager("count");
getDimensions(x,y,c,s,f);
if (nroi==s)
	multimeasure_on_stack(fn);



function multimeasure_on_stack(fn)
{
nroi=roiManager("count");
for(i=0;i<nroi;i++)
{
	selectWindow(fn);
	setSlice(i+1);
	roiManager("Select",i);
	roiManager("Measure");	
}

}