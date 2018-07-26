

in_dir="G:\\shimako_20160311\\Heart_20160311_221022\\raw_tiff\\";
fl=getFileList(in_dir);

setBatchMode(true);
for (i=0;i<fl.length;i++){
fn=fl[i];
if (endsWith(fn,'oib.tif'))
{
print(in_dir+fl[i]);
open(in_dir+fl[i]);

run("Stack to Images");
save(in_dir+"\\CH4\\"+fl[i]+'.tif');
close();
save(in_dir+"\\CH3\\"+fl[i]+'.tif');
close();
save(in_dir+"\\CH2\\"+fl[i]+'.tif');
close();
save(in_dir+"\\CH1\\"+fl[i]+'.tif');
close();

showProgress(i+1,fl.length);

close("*");

}
}

setBatchMode(false);

//
////close();
//selectWindow("Image201_01.oib");
//close();
