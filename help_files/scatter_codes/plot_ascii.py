
import os
import numpy as np
import glob
import scipy.ndimage as ndimage
import pandas as pd

folders=[    r'L:\ORGANIZED_DATA\CELL_TIME\20180405_231_REPL\DYES_1khz\r6G_timje\reanalysis_conf_paper_supplementary_fifgure'
         ]

fileindex=0
from matplotlib.pyplot import *
for r in folders:
    print 
    print r
    os.chdir(r)
    fl=glob.glob(r'*value.asc')
    for i in fl:
        if i.find(".")>-1:
            intensity=np.loadtxt(i[:-21]+'photons.asc')
            if intensity.mean()>0:
                #datam=intensity>intensity.mean()
                #intensity=ndimage.gaussian_filter(intensity,3)
                data=np.loadtxt(i)
                if data.mean()>0:
                    #threshold=np.percentile(intensity,35)
                    threshold=intensity.mean()
                    datam=(intensity>threshold)&(data>20)&(data<8500)                
                    a1p=np.loadtxt(i.replace('color coded value.asc','a1[%].asc'))
                    a2p=np.loadtxt(i.replace('color coded value.asc','a2[%].asc'))
                    t1=np.loadtxt(i.replace('color coded value.asc','t1.asc'))
                    t2=np.loadtxt(i.replace('color coded value.asc','t2.asc'))                    
                    f1=a1p*t1/(a1p+a2p)
                    f2=a2p*t2/(a1p+a2p)
                    itm=(f1*t1+f2*t2)/(f1+f2)
                    f1=f1*100/(f1+f2)
                    #print i,int(i.split('SP')[1][0]),int(i.split('TP')[1][:2])
                    print itm[datam].mean(),data[datam].mean(),f1[datam].mean(),a1p[datam].mean()
                    
                    dft=pd.DataFrame({'fileindex':[fileindex],
                                         #'TP':[int(i.split('TP')[1][:2])],                                      
                                         #'SP':[int(i.split('SP')[1][0])],
                                         'cell': [i.split('_')[0]],
                                         'well':[i.split('_')[1][-1]],
                                         'filename':[i],
                                         #'conf':int(i.split('_')[1][:-1]),
                                         'Intensity':[intensity[datam].mean()],
                                         'iTM':[itm[datam].mean()],
                                         'f1':[f1[datam].mean()],
                                         'TM':[data[datam].mean()],
                                         #'a1p':[a1p[datam].mean()],
                                         'folder':[os.path.split(r)[-1]]
                                         })
                    if fileindex==0:
                        df=dft.copy()
                        fileindex=fileindex+1
                    else:
                        df=df.append(dft)
                        fileindex=fileindex+1
                                     
        else:
            print i,'  is not nadh data?'

if df.shape:
    os.chdir(r'D:\JenuChacko')
    df=df.set_index('filename')    
    pd.DataFrame.to_excel(df,'results_.xls')
    
