import os 
import glob

fl=glob.glob('*.sdt')

import zipfile
import numpy as np
from matplotlib.pyplot import *

arr=[]
plot_on=True
for i in fl:
    zip_ref = zipfile.ZipFile(i, 'r')
    zip_ref.extractall('.')
    zip_ref.close()
    print i
    with open('data_block') as fid:
        data=fid.read()
        data=np.fromstring(data,np.uint16)
    if data.size==256*256*256:
        data=data.reshape([256,256,256])
        
        img=data.mean(2)
        mask=img<img.mean()
        data_mask=np.broadcast_to(mask,[256,256,256])
        data_mask=np.transpose(data_mask,(1,2,0))
        data[data_mask]=0
        
        if plot_on:
            subplot(211)
            imshow(data.mean(2),cmap='gray')
            colorbar()
            title(i)
            axis('off')       
            subplot(212)
            lt= data.sum(0).sum(0)
            th=lt.mean()/1.5
            #th=np.percentile(lt,10)
            lt1=lt[lt>th]
            #lt2=lt1[lt1>lt1.min()]
            plot(np.arange(.04,(len(lt1))*.04,.04),lt1)
            savefig(i[:-4]+'png')
            close()
        
for i in arr:
    plot(i)
    savefig('resultXXXX.png')
    close()
