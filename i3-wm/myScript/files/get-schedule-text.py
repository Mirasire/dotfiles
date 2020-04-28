#!/bin/python
#feature: html -> text

#reglex
import re
#getTime
import time
#import BeautifulSoup
from bs4 import BeautifulSoup

def sigleOrDoubel(str0):
    num=2;
    if str0.find('单')!=-1:
        num=1
    elif str0.find('每')!=-1:
        num=0
    return num

#return week,hour,minutes
def getTime():
    #get now date
    now_time=time.localtime()
    now_wk=now_time.tm_wday
    now_hour=now_time.tm_hour
    now_min=now_time.tm_min
    return [now_wk,now_hour,now_min]

if __name__ == "__main__":
    #dealwith the printf
    soup = BeautifulSoup(open("schedule.html","r",encoding='GBK'))
    #print(soup.prettify())
    tbody=soup.find_all("tbody")
    all_tr=tbody[0].find_all('tr')
    class_list=[[] for i in range(10)]
    for tr in all_tr[0:len(all_tr)-1]:
        all_td=tr.find_all('td')
        num=0
        for td in all_td:
            info=td.contents;
            if num==0:
                timeinfo=info[2].split('-')
            elif len(info)==7:
                #0=1-16, 1=single(1-16), 2=double(1-16)
                class_list[num].append([timeinfo,info[0],info[4],re.match(r'[0-9]-[0-9][0-9]',info[6]).group(),sigleOrDoubel(info[6])])
            num+=1
    for i in class_list:
        if len(i)>=1:
            print(i)
    print(getTime())
