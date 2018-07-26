function Splitproj(input,output,filename) {
	if (endsWith(filename,"tif")){ 
	open(input+filename);	
	run('Stack to Images');
	fn=getTitle();
	print (fn);
	saveAs('Tiff...',output+'ch4/'+fn);
	close();
	fn=getTitle();
	print (fn);
	saveAs('Tiff...',output+'ch3/'+fn);
	close();
	fn=getTitle();
	print (fn);
	saveAs('Tiff...',output+'ch2/'+fn);
	close();
	fn=getTitle();
	print (fn);
	saveAs('Tiff...',output+'ch1/'+fn);
	close();	
	run('Close All');
	}
}

input ='//LFD-Server/Files/Data/lfdguest1/varghesj/uniform_field_correction/FV10__20151123_105917/stitching/SPLIT/';
output='//LFD-Server/Files/Data/lfdguest1/varghesj/uniform_field_correction/FV10__20151123_105917/stitching/SPLIT/';
setBatchMode(true);
list=getFileList(input);
for(i=0;i<list.length;i++)
	Splitproj(input,output,list[i]);
setBatchMode(false);
