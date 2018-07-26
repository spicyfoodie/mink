
in_dir="\\\\LFD-Server\\Users\\varghesj\\My Desktop\\RICS\\48hpf\\E3\\"
//in_dir="G:\\Data_01\\1604\\0414\\sailesh_tissue_01\\tonsil\\Heart_20160414_224854\\";
//in_dir="\\\\LFD-Server\\Files\\Data\\lfdguest1\\varghesj\\Heart_20160311_184804\\";
fl=getFileList(in_dir);

setBatchMode(true);
for (i=0;i<fl.length;i++){
fn=fl[i];
if (endsWith(fn,'nd2'))
{
print(in_dir+fl[i]);
open(in_dir+fl[i]);
//run("Z Project...", "projection=[Sum Slices]");
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
