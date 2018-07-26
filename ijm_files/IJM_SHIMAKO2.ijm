

in_dir="D:\\test_files\\NewFolder\\0202_Lungs_fat\\process_af002\\";
//in_dir="\\\\LFD-Server\\Files\\Data\\lfdguest1\\varghesj\\Heart_20160311_184804\\";
fl=getFileList(in_dir);

setBatchMode(true);
for (i=0;i<fl.length;i++){
fn=fl[i];
if (endsWith(fn,'oib'))
{
print(in_dir+fl[i]);
fnv= "open=" + in_dir+fl[i] + " autoscale color_mode=Default view=Hyperstack stack_order=XYCZT";
print(fnv);
run("Bio-Formats Importer",fnv);
//open();
run("Z Project...", "projection=[Sum Slices]");
//run("Save", "save="+fn+".tif"); // saves in fiji folder
save(in_dir+fl[i]+'.tif');
showProgress(i+1,fl.length);

close("*");

}
}

setBatchMode(false);

//
////close();
//selectWindow("Image201_01.oib");
//close();
