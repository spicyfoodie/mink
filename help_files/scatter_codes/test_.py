import os
os.chdir(r'D:\JenuChacko\20171113_pancrea_susanPayne\Fresh_CTRL')

import glob
fl=glob.glob('*.img')

for i in fl:
    #print int(i.split('_')[1][:-1])
    print i.split('_')[1],i.split('_')[0]
    
