

in_dir="D:\\test_files\\NewFolder\\0202_Lungs_fat\\process_af002\\";
//in_dir="\\\\LFD-Server\\Files\\Data\\lfdguest1\\varghesj\\Heart_20160311_184804\\";
fl=getFileList(in_dir);

setBatchMode(true);
for (i=0;i<fl.length;i++){
fn=fl[i];
if (endsWith(fn,'tif'))
{
print(in_dir+fl[i]);
//fnv= "open=" + in_dir+fl[i] + " autoscale color_mode=Default view=Hyperstack stack_order=XYCZT";
//print(fnv);
//run("Bio-Formats Importer",fnv);
open(in_dir+fl[i]);
//run("Z Project...", "projection=[Sum Slices]");
//
//run("Duplicate...", "duplicate channels=1");
//run("Save", "save="+fn+".tif"); // saves in fiji folder
//save(in_dir+fl[i]+'.tif');
//run("Close");
run("Duplicate...", "duplicate channels=2");
//run("Save", "save="+fn+".tif"); // saves in fiji folder
save(in_dir+fl[i]+'ch2.tif');

run("16_colors");
showProgress(i+1,fl.length);

close("*");

}
}

setBatchMode(false);

//
////close();
//selectWindow("Image201_01.oib");
//close();
