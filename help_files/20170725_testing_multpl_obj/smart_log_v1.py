
import os


t1=100
#minkfolder=os.getcwd()
#mink_folder={'key':' directories'}

# WRITE INTO CURRENT
def log_manager(item, location):
    # mink_folder['mink']=os.getcwd()
    mink_folder[item] = location

def log_read_existing(filename='log.txt'):
    #print "opening:",filename
    if os.path.exists(filename):
        with open(filename, 'r') as fid:
            lines = fid.read()
        return (lines[:-1])
    else:
        print filename , " file not found"

def log_populate_dict(filename='log.txt'):
    lines=log_read_existing(filename)
    if lines is not None:
        lines=lines.split('\n')
        return_dict={}
        new_lines=[]
        for line in lines:
            if line.find('=')>1:
                return_dict[line.split('=')[0]]=line.split('=')[1]
        return(return_dict)

def log_write_clean(data, filename='log.txt'):
    with open(filename, 'w+') as fid:
        fid.write(data)
        fid.write('\n')

def log_write_existing(data, filename='log.txt'):
    with open(filename, 'a+') as fid:
        fid.write(data)
        fid.write('\n')

def log_get_value(key, filename='log.txt'):
    if not os.path.exists(filename):
        filename=os.path.join(mink_folder[key],filename)
    if os.path.exists(filename):
        lines = log_read_existing(filename)
        if lines is not None:
            lines = lines.split('\n')
            key_found=False
            new_lines = []
            for line in lines:
                if line.find('=') > 1:
                    key0 = line.split('=')[0]
                    #value0 = line.split('=')[1]
                    if key0 == key:
                        key_found=True
                        value=line.split('=')[1]
            if not key_found:
                value=None
            return(value)
    else:
        return(None)

def log_write_replace(key, value, filename='log.txt'):
    lines = log_read_existing(filename)
    if lines is not None:
        lines = lines.split('\n')
        key_found=False
        new_lines = []
        for line in lines:
            if line.find('=') > 1:
                key0 = line.split('=')[0]
                #value0 = line.split('=')[1]
                if key0 == key:
                    new_lines.append(key + '=' + value)
                    key_found=True
                else:
                    new_lines.append(line)
        if not key_found:
            new_lines.append(key+'='+value)

        with open(filename, 'w') as fid:
            for line in new_lines:
                fid.write(line + '\n')

def log_write_dict(dict1,filename='log.txt'):
    data=''
    for i in dict1.keys():
        data=data+i+'='+dict1[i]+'\n'
    with open(filename,'w') as fid:
        fid.write(data)

mink_folder=log_populate_dict('log.txt')
if mink_folder is None:
    mink_folder = {'key': ' directories'}

log_manager('mink', os.getcwd())

def check_log_location(mink_key,mink_folder=mink_folder):
    if mink_key in mink_folder:
        if os.path.exists(mink_folder[mink_key]):
            os.chdir(mink_folder[mink_key])
            print "last used location",mink_folder[mink_key]
