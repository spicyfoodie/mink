fn=getDirectory('poen');
//fn="D:\\Users\\lfdguest1\\Jenu\\Kumar_\\20170227\\WT_AMO\\";
setBatchMode(true); 
list = getFileList(fn);
for (i = 0; i < list.length; i++)
        {

if(endsWith(list[i],"oib"))
{
filename= fn+list[i];
run("Bio-Formats", "open="+filename+" color_mode=Default rois_import=[ROI manager] split_channels view=Hyperstack stack_order=XYCZT");
run("Enhance Contrast", "saturated=0.35");
fname=getTitle();
run("Scale Bar...", "width=5 height=4 font=14 color=White background=None location=[Lower Right] bold overlay");
saveAs("Jpeg", fn+fname+".jpg");
run("Close All");

	}

        	}
setBatchMode(false);

