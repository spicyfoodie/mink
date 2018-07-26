
import os
import numpy as np
import glob
import scipy.ndimage as ndimage


folders=[]
master_folder=r'L:\ORGANIZED_DATA\CELL_TIME\20180405_231_REPL\DYES_1khz\r6G_timje\reanalysis_conf_paper_supplementary_fifgure'
for root,dirs,files in os.walk(master_folder):
    if len(dirs)>1:
        for dir1 in dirs:
            folders.append(os.path.join(root,dir1))
        
#folders=[#r'D:\JenuChacko\HPV_RETRIAL_fIXATION\hpv\hpv_\worked\FRESH_HPV',
         #r'D:\JenuChacko\HPV_RETRIAL_fIXATION\hpv\hpv_\worked\FRESH_PANC',
         #r'D:\JenuChacko\HPV_RETRIAL_fIXATION\hpv\hpv_\worked\PFA_HPV',
         #r'D:\JenuChacko\HPV_RETRIAL_fIXATION\hpv\hpv_\worked\PFA_PANC',
         #r'D:\JenuChacko\HPV_RETRIAL_fIXATION\hpv\hpv_\worked\NBF_HPV',
         #r'D:\JenuChacko\HPV_RETRIAL_fIXATION\hpv\hpv_\worked\NBF_PANC',

         #r'D:\JenuChacko\4cell_series_2\imaging\HPV_replicated\HPV2_Fresh',
         #r'D:\JenuChacko\4cell_series_2\imaging\HPV_replicated\PANC2_Fresh'
        #r'D:\JenuChacko\4cell_series_2\imaging\HPV_replicated\HPV3',
        #r'D:\JenuChacko\4cell_series_2\imaging\HPV_replicated\hpv3_powerseries'
        #r'D:\JenuChacko\4cell_series_2\imaging\HPV_replicated\HPV5_PFA'
        #r'D:\JenuChacko\4cell_series_2\imaging\HPV_replicated\HPV4_NBF'
    
        #r'D:\JenuChacko\4cell_series_2\imaging\HPV_replicated\PANC3_PFA_certain'
        #r'D:\JenuChacko\4cell_series_2\CONF\20171006_confluency\10A',
        #r'D:\JenuChacko\4cell_series_2\CONF\20171006_confluency\HPV'
        
         #]
         
from matplotlib.pyplot import *
for r in folders:
    print 
    print r
    #print 
    os.chdir(r)
    fl=glob.glob(r'*value.asc')
    for i in fl:
        #print i
        if i.find(".")>-1:
        #if i.find("tile")>-1:    
            intensity=np.loadtxt(i[:-21]+'photons.asc')
            if intensity.mean()>0:
                datam=intensity>intensity.mean()
                #intensity=ndimage.gaussian_filter(intensity,3)
                #print np.percentile(intensity,50),sum(intensity.ravel())
                datam=intensity>np.percentile(intensity,50)
                data=np.loadtxt(i)
                print i,
                #print i.split('_')[1],
                print intensity[datam].mean(),#data.mean(),
                print data[datam].mean()#,data[datam].std()
                #if len(data[datam])>0:
                 #   print data[datam].mean()
            
        else:
            print i,'  is not nadh data?'

    #import pandas as pd
    #df=pd.DataFrame.from_records(data)
    #print df.head()
    #print df.groupby(2).mean()
