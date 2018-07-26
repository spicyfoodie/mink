function Splitoib(ifolder,output,filename) {
	if (endsWith(filename,"oib")){ 

	location=ifolder+filename ;
	print(location);
	run("Bio-Formats", "open=["+location+"] color_mode=Default rois_import=[ROI manager] split_channels view=Hyperstack stack_order=XYCZT use_virtual_stack");
	
	fn=getTitle();
	getDimensions(width, height, channelCount, sliceCount, frameCount);
	print (fn);
	saveAs('Tiff...',output+fn);
	close();
	print(channelCount,'channels found');
	if (channelCount>1) {	
		fn=getTitle();
		print (fn);
		saveAs('Tiff...',output+fn);
		close();
		}
	if (channelCount>2) {
	fn=getTitle();
	print (fn);
	saveAs('Tiff...',output+fn);
	close();
	};
	
	run('Close All');
	}
}


function getavg()
{	 	    title=getTitle();	
			getDimensions(width, height, channelCount, sliceCount, frameCount);		    
			//print('Frames=',frameCount);			
			if(frameCount>1){
			run("Z Project...", "projection=[Average Intensity]");	
			selectWindow(title);
			close();
			selectWindow('AVG_'+title);
			rename(title);
			print(title,' is now average from ',frameCount, 'frames');	
			};
				
};

function fix_shadow()
{
	t1=getTitle();
	run("Duplicate...", " ");
	rename("t2");
	run("Gaussian Blur...", "sigma=5");
	imageCalculator("Divide create 32-bit", t1,"t2");	
	rename("shadow_removed");
	selectWindow(t1);
	close();
	selectWindow("t2");
	close();
	selectWindow("shadow_removed");
	rename(t1);
	run("Enhance Contrast", "saturated=0.35");
}


function oibavg(ifolder,output,filename) {
	if (endsWith(filename,"oib")){ 
	location=ifolder+filename ;
	print(location);
	run("Bio-Formats", "open=["+location+"] color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT use_virtual_stack");
	// find number of channels abd y=units
	CH=parseInt(getInfo('SizeC'));
	getDimensions(width, height, channelCount, sliceCount, frameCount);	
	
	chlist=newArray(CH+1);	
	// get ch names
	for(i=1;i<=CH;i++){	
	chname=toString(i);
	chlist[i]=getInfo("[Channel "+chname+" Parameters] CH Name");
	}
	// split and average channels
	fn=getTitle();
	if(CH>1)
	{
	run("Split Channels");
	
	// get channel by channel
	for(i=1;i<=CH;i++){	
	chname=toString('C'+i+'-');
	selectWindow(chname+fn);
	getavg();
	run("Enhance Contrast", "saturated=0.35");	
	
	if (endsWith(chlist[i],'CHS1')){
		run("Cyan Hot");
		saveAs('Png',output+fn+chname);}
	if (endsWith(chlist[i],'CHS2')){
		run("Red Hot");
		saveAs('Png',output+fn+chname);}
	if (endsWith(chlist[i],'TD1'))
		{run("Grays");	
		fix_shadow();
		run("Enhance Contrast", "saturated=0.35");
		saveAs('Jpeg',output+fn+chname);}	
	
	//saveAs('Png',output+chname+fn);
	close();	
	}
	}
	else
	{
	getavg();
	run("Enhance Contrast", "saturated=0.35");	
	run("Grays");	
	fix_shadow();
	run("Scale Bar...", "width=5 height=4 font=14 color=White background=None location=[Lower Right] bold overlay");
	saveAs('Jpeg',output+fn+chname);	
	close();


				
		}
	} 	
	}


setBatchMode(true);
ifolder=getDirectory("Select OIB folder")
ofolder=ifolder;
list=getFileList(ifolder);
for(i=0;i<list.length;i++)
	{
	oibavg(ifolder,ofolder,list[i]);}
setBatchMode(false);
print('over');
