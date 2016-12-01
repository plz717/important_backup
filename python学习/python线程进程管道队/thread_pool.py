#!/usr/bin/python

import multiprocessing as mul
import subprocess

def download(x):
    out = subprocess.call(["wget",x])

#you can use either "blala" or 'blala' to express a website
add1="www.baidu.com"
add2="www.163.com"
add3="www.iciba.com"     
add4='www.cnblogs.com'
add5='www.qq.com'

pool=mul.Pool(3)
pool.map(download,[add1,add2,add3,add4,add5])

'''
import multiprocessing as mul
import subprocess
 
def func(target):
    rc = subprocess.call(['wget',target])
urls=[]
for line in open('urls.txt'):
    urls.append(line.strip())
print urls
pool = mul.Pool(3)
pool.map(func,urls)
'''
