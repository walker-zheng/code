#!/usr/bin/env python
# −*− coding: UTF−8 −*−
import os, Image

def binary(f):
    img = Image.open(f)
    #img = img.convert('1')
    pixdata = img.load()
    for y in xrange(img.size[1]):
        for x in xrange(img.size[0]):
            if pixdata[x, y][0] < 90:
                pixdata[x, y] = (0, 0, 0, 255)
    for y in xrange(img.size[1]):
        for x in xrange(img.size[0]):
            if pixdata[x, y][1] < 136:
                pixdata[x, y] = (0, 0, 0, 255)
    for y in xrange(img.size[1]):
        for x in xrange(img.size[0]):
            if pixdata[x, y][2] > 0:
                pixdata[x, y] = (255, 255, 255, 255)
    return img

def convert():
    fontdir="./font/"
    newdir="./num/"
    for f in os.listdir(fontdir):
        if f.endswith(".jpg"):
            binary(fontdir+f).save(newdir+f.replace("jpg","bmp"))
            #放大图像 方便识别
            # im_orig = Image.open('input-black.gif')
            # big = im_orig.resize((500, 500), Image.NEAREST)

def division(img):
    font=[]
    for i in range(6):
        x=2+i*9
        y=6
        font.append(img.crop((x,y,x+9,y+12)))
    return font

def recognize(img):
    fontMods = []
    newdir="./num/"
    for f in os.listdir(newdir):
        fontMods.append((f.replace(".bmp",""), Image.open(newdir+f)))
    result=""
    font=division(img)
    for i in font:
        target=i
        points = []
        for mod in fontMods:
            diffs = 0
            for yi in range(12):
                for xi in range(8):
                    if mod[1].getpixel((xi, yi)) != target.getpixel((xi, yi)):
                        diffs += 1
            points.append((diffs, mod[0]))
        points.sort()
        result += points[0][1]
    return result

if __name__ == '__main__':
    codedir="./code/"
    convert()
    for imgfile in os.listdir(codedir):
        if imgfile.endswith(".jpg"):
            dir="./result/"
            img=binary(codedir+imgfile)
            num=recognize(img)
            dir += (num+".png")
            print "save to", dir
            img.save(dir)
