import os

os.chdir(r'L:\_JenuChacko_001_LOCI\FIXATION_CONF')

with open('reanalysis.txt','r') as fid:
    filelist=fid.readlines()

for fl_names in filelist:
    
    if len(fl_names)>1:
        foldername = fl_names.split(',')[0]
        kind =     fl_names.split(',')[1]
        os.chdir(foldername)
        print kind
