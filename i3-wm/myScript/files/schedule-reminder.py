#!/bin/python
# feature: TKK Class_info Schedule Reminder
# icon Link: http://www.fontawesome.com.cn/icons-ui/
#            icon chose   |   |   |  |   |  |  |   |  |  |   |   |  | 

import os
import sys
from getTime import *
#getTime return [week,hour,minutes]
#plan=[[week],[week],[week],...]
#week=[classinfo1,classinfo2]
#classinfo=[flag,time_info,class_name,class_location,week_range,SigleorDouble]

def foundClassInfo():
    LOCAL="/home/mirasire/.myScript/files"
    os.system("touch {}/classinfo.py".format(LOCAL))
    if  os.path.getsize("{}/classinfo.py".format(LOCAL))==0:
        os.system("sh {}/create-classinfo.sh".format(LOCAL))

def formateClassInfo(status,diff_time,cs,nxt_cs=[]):
    class0="{name}  {location}".format(name=cs[2],location=cs[3])
    class1="{name}  {location}".format(name=nxt_cs[2],location=nxt_cs[3]) if len(nxt_cs) != 0 else ''
    message=""
    if status==1:
        message="  剩余 {} 分钟".format(diff_time)
        message="{} | 下节课: {} <{}>".format(message,class1,nxt_cs[1][0]) if nxt_cs!=[] else "{} |  ".format(message)
    else:
        message="{}  剩余 {} 分钟".format(class0,diff_time)
    ret = " {} ".format(message)
    return ret

if __name__ == "__main__":
    tm_info=getTime()
    tm_wk=tm_info[0]
    tm_hw=toMin(tm_info[1],tm_info[2])
    #init
    foundClassInfo()
    from classinfo import class_info as plan
    #deal with
    for i,cs in enumerate(plan[tm_wk]):
        #if cs!=plan[tm_wk][-1]:
        nxt_cs=(plan[tm_wk][i+1] if cs!=plan[tm_wk][-1] else [])
        cs_btm=strToMin(cs[1][0])
        cs_etm=strToMin(cs[1][1])
        if tm_hw <= cs_btm or tm_hw < cs_etm:
            tm_diff = -(tm_hw - (cs_btm if tm_hw <= cs_btm else cs_etm))
            if tm_hw < cs_btm and tm_diff<=20:
                print(formateClassInfo(0,tm_diff,cs))
            elif tm_diff <= 20 and tm_diff>0:
                print(formateClassInfo(1,tm_diff,cs,nxt_cs))
            elif tm_hw>=cs_btm:
                print('Pleace Foucing on Class  ')
            else:
                print('  ')
            break
