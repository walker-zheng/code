#!/usr/bin/python


import os ,Image
j = 1
dir="./code/"
for f in os.listdir(dir):
    if f.endswith(".jpg"):
        img = Image.open(dir+f)
        img = img.convert('RGB')
        for i in range(6):
            x = 5 + i*9
            y = 6
            img.crop((x, y, x+9, y+13)).save("font/%d.jpg" % j)
            print "j=",j
            j += 1

