

in_dir="G://Data_01//1604//0406//TATSU_yeast_cells//OIB//2_YPAD_Mcherry//";


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
run("Split Channels");
//run("Z Project...", "projection=[Sum Slices]");
//run("Save", "save="+fn+".tif"); // saves in fiji folder
saveAs("Jpeg",in_dir+fl[i]+'.jpg');
showProgress(i+1,fl.length);

close("*");

}
}

setBatchMode(false);

//
////close();
//selectWindow("Image201_01.oib");
//close();
