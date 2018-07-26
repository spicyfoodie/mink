import os

def get_size(start_path = '.'):
    total_size = 0
    for dirpath, dirnames, filenames in os.walk(start_path):
        for f in filenames:
            fp = os.path.join(dirpath, f)
            total_size += os.path.getsize(fp)
    return total_size

def get_size_path(root1):
    print root1
    folders=os.listdir(root1)
    omitted=[]
    
    for i in folders:
        folder_path=os.path.join(root1,i)
        if os.path.isdir(folder_path):
            try:
                print i,'\t', get_size(folder_path)
            except:
                print i,'\t','skipped'
    for i in omitted:
        print i,'OMITTED'
        
    print '\n\n\n'


get_size_path(root1=r"Z:")
get_size_path(root1=r"\\bockdrive.bocklabs.wisc.edu\LOCI")              
              
