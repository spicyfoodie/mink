fd= getDirectory('open');
run("Image Sequence...", "open="+fd+" file=png sort use");
run("8-bit");
run("Enhance Contrast", "saturated=0.35");
fname= getTitle()
run("Cyan Hot");
run("Green Fire Blue");
//print(fname);
saveAs("Tiff",fd+'Append_tif.tif');
run("Animated Gif ... ", "name="+fname+" set_global_lookup_table_options=[Load from Current Image] optional=[] image=[No Disposal] set=500 number=-1 transparency=[No Transparency] red=0 green=0 blue=0 index=0 filename="+fd+'Append_gif.gif');
close();
