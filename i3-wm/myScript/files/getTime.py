#!/bin/python
#feature: html -> text

#getTime
import time

#return week,hour,minutes
def getTime():
    #get now date
    now_time=time.localtime()
    now_wk=now_time.tm_wday
    now_hour=now_time.tm_hour
    now_min=now_time.tm_min
    return [now_wk,now_hour,now_min]

#return all minus since 00:00
def toMin(hours,mints):
    return hours*60+mints;

#type like 01:12 - > int(min)
def strToMin(strs):
    tm=strs.split(':');
    return toMin((int)(tm[0]),(int)(tm[1]))
