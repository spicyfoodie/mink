

import os
import numpy as np
import tifffile as tf


for root,dirs,files in os.walk(r'D:\JenuChacko\mcf\confluency_calibrations',
                               False):
        for file1 in files:
            if file1.find("photons.asc")>-1:
                #print os.path.join(root,file1)
                fn=os.path.join(root,file1)
                nfn=os.path.join(root,file1[:-4]+'.tif')
                print nfn    
                data=np.loadtxt(fn)                
                tf.imsave(nfn,data.astype(np.float32))
    
