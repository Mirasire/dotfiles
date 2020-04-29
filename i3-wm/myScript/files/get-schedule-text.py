#!/bin/python
#feature: html -> text

#reglex
import re
#import BeautifulSoup
from bs4 import BeautifulSoup

def sigleOrDoubel(str0):
    num=2;
    if str0.find('单')!=-1:
        num=1
    elif str0.find('每')!=-1:
        num=0
    return num


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
                if tr['class'][0]=='odd':
                    for i in range(1,8):
                        if len(class_list[i])!=0 and class_list[i][-1][0]==1:
                            class_list[i][-1][0]=0
                            class_list[i][-1][1][1]=timeinfo[1]
            elif len(info)==7:
                #0=1-16, 1=single(1-16), 2=double(1-16)
                #[flag,time_info,class_name,class_location,week_range,SigleorDouble]
                class_list[num].append([1,timeinfo,info[0][0:info[0].find('(',1)],info[4],re.match(r'[0-9]-[0-9][0-9]',info[6]).group(),sigleOrDoubel(info[6])])
            num+=1
    print("class_info=[",end='')
    for i in class_list:
        if len(i)>=1:
            print(i,('' if(i==class_list[5]) else ','),end='')
        num+=1
    print("]")
