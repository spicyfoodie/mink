getDateAndTime(year, month, dayOfWeek, dayOfMonth, hour, minute, second, msec);
//day and month are on list index- 0 to 11 or 0 to 6
print(d2s(year,0)+d2s(month+1,0));
tstring= d2s(year,0) + d2s(month+1,0) + d2s(dayOfMonth,0)+"-"+d2s(hour,0) + d2s(minute,0)+"-" + d2s(second,0) ;
print(tstring);
print(d2s(random()*1000,0));

dir=getDirectory("Choose a Directory"); 
print(dir); 
splitDir= dir + "/OneChannel"; 
File.makeDirectory(splitDir); 
