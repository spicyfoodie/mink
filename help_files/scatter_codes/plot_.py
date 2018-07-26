import os
import numpy as np

os.chdir(r'D:\JenuChacko\mcf\confluency_calibrations\confluency_calibration_brightfiled')


data=np.loadtxt(r'100R.txt')
print data.shape

import pandas as pd

df=pd.DataFrame.from_records(data)
print df.head()
#for slice in range(9):
#    sl=slice+1
print df.groupby(2).mean()
