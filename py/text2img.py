#! /usr/bin/python
# -*- coding: utf-8 -*-
'''
#	使用 convert(ImageMagick) 转换png为gif图片：
	ls |sed 's/\(.*\).png/convert \1.png -flatten -channel A -threshold 0% \1.gif/g'
#	cx-freeze打包：
	Python setup.py build
	Python setup.py bdist_msi
'''
from os import mkdir
from os import walk
from os import path
from os import getcwd
import sys
from math import floor
from codecs import open
#   from pathlib import Path
#   from inspect import getsourcefile
#   from os.path import abspath
import pygame

def AAfilledRoundedRect(surface,rect,color,radius=0.4):
    """
    AAfilledRoundedRect(surface,rect,color,radius=0.4)

    surface : destination
    rect    : rectangle
    color   : rgb or rgba
    radius  : 0 <= radius <= 1
    """

    rect         = pygame.Rect(rect)
    color        = pygame.Color(*color)
    alpha        = color.a
    color.a      = 0
    pos          = rect.topleft
    rect.topleft = 0,0
    rectangle    = pygame.Surface(rect.size,pygame.SRCALPHA)

    circle       = pygame.Surface([min(rect.size)*3]*2,pygame.SRCALPHA)
    pygame.draw.ellipse(circle,(0,0,0),circle.get_rect(),0)
    circle       = pygame.transform.smoothscale(circle,[int(min(rect.size)*radius)]*2)

    radius              = rectangle.blit(circle,(0,0))
    radius.bottomright  = rect.bottomright
    rectangle.blit(circle,radius)
    radius.topright     = rect.topright
    rectangle.blit(circle,radius)
    radius.bottomleft   = rect.bottomleft
    rectangle.blit(circle,radius)

    rectangle.fill((0,0,0),rect.inflate(-radius.w,0))
    rectangle.fill((0,0,0),rect.inflate(0,-radius.h))

    rectangle.fill(color,special_flags=pygame.BLEND_RGBA_MAX)
    rectangle.fill((255,255,255,alpha),special_flags=pygame.BLEND_RGBA_MIN)

    return surface.blit(rectangle,pos)
def splitByLen(string, width):
    return [string[x:x+width] for x in range(0, len(string), width)]
def generate_pic(hasBackgroud):
    #   import os.path
    #   try:
    #       dir_path = os.path.dirname(os.path.abspath(__file__))
    #   except NameError:  # We are the main py2exe script, not a module
    #       import sys
    #       dir_path = os.path.dirname(os.path.abspath(sys.argv[0]))
    #   dir_path = path.dirname(path.realpath(__file__))
    #   dir_path = Path(__file__).parent
    #   dir_path = abspath(getsourcefile(lambda:0))
    #   if getattr(sys, 'text2img', False):
    #       # The application is frozen
    #       dir_path = path.dirname(sys.executable)
    #       Print("found install path:" + dir_path)
    path_prefix = getcwd()
    pygame.init()
    fontPath = path.join(path_prefix, "fonts\\")
    text = u'获取测试文本长度哈哈'
    line_len = len(text)
    fontSize = 15
    fontHeight = 200             # 35 40 50 # 单字高度 越大字越清
    fontEdge = 0.25             # 图片边距
    picEdge = 1600             # 240 # 图片边长 单行字数 = picEdge/fontHeight
    dst_scale = 240/picEdge
    width_plus = fontHeight * fontEdge
    height_plus = fontHeight * fontEdge
    radius_default = 0.5
    color_white = (255, 255, 255, 255)
    color_gray = (204, 204, 204, 255)
    color_black = (0, 0, 0, 0)
    isSmoooth = True
    if hasBackgroud:
        color_bg = color_gray
        color_fg = color_white
        image_bg = "-bg"
    else:
        color_bg = None
        color_fg = color_black
        image_bg = ""
    imagePath = path.join(path_prefix, "images\\")
    Print(u"图片将生成在目录:\t\t\t\t\t" + imagePath)
    mkdir(imagePath) if not path.exists(imagePath) else None
    input_file = path.join(path_prefix,"1.txt")
    if not path.exists(input_file):
        Print(u"[退出]当前目录无文件:\t\t\t\t" + input_file)
        return
    else:
        Print(u"以文件内容为输入:\t\t\t\t\t" + input_file)
    if not path.exists(fontPath):
        Print(u"[退出]未找到字体:\t\t\t\t\t" + fontPath)
        return
    else:
        Print(u"搜索字体:\t\t\t\t\t\t\t" + fontPath)
    for _,_,filenames in walk(path.join(fontPath)):
        fontCount = 0
        for filename in filenames:
            font = pygame.font.Font(path.join("fonts", filename), fontSize)
            _rtext = font.render(text, isSmoooth, color_fg, color_bg)
            _width, _height = _rtext.get_size()
            while _height < fontHeight:
                fontSize += 1
                font = pygame.font.Font(path.join("fonts", filename), fontSize)
                _rtext = font.render(text, isSmoooth, color_fg, color_bg)
                _width, _height = _rtext.get_size()
            if hasBackgroud:
                echoBG= u"带"
            else:
                echoBG= u"无"
            Print(u"使用["+ str(fontSize).zfill(3) + "]号字体" + echoBG + "背景色:\t\t\t" + path.join(fontPath, filename))
            fontCount += 1
            width_one = _width/len(text)
            line_len = floor(picEdge/(width_one+2*fontEdge))
            imagePath_font = imagePath + path.splitext(filename)[0]
            imagePath_big = imagePath_font + "\\big" + image_bg
            imagePath_small = imagePath_font + "\\small" + image_bg
            imagePath_huge = imagePath_font + "\\huge" + image_bg
            mkdir(imagePath_font) if not path.exists(imagePath_font) else None
            mkdir(imagePath_huge) if not path.exists(imagePath_huge) else None
            mkdir(imagePath_big) if not path.exists(imagePath_big) else None
            mkdir(imagePath_small) if not path.exists(imagePath_small) else None
            Print(u"将生成最大[" + str(picEdge) +  "]pix的图片:\t\t\t" + imagePath_huge)
            Print(u"将生成[" + str(picEdge*dst_scale) + "x" + str(picEdge*dst_scale) +  "]pix的微信图片:\t" + imagePath_big)
            Print(u"将生成[" + str(picEdge*dst_scale/2) + "x" + str(picEdge*dst_scale/2) +  "]pix的微信图片:\t" + imagePath_small)
            count = 0
            for line in open(input_file, mode='r', encoding='utf-8'):
                line = line.strip("\n")
                if len(line) == 0:
                    continue
                lines = [line]
                if len(line) > line_len:
                    lines = splitByLen(line, line_len)
                rtext1 = pygame.Surface((width_one * len(lines[0]) + width_plus * 2, _height * len(lines) + height_plus * 2), pygame.SRCALPHA)
                rtext1.set_alpha(0)
                if hasBackgroud:
                    AAfilledRoundedRect(rtext1, rtext1.get_rect(), color_bg, 0.5)
                line_count = 0
                for every in lines:
                    rtext = font.render(every, isSmoooth, color_fg, color_bg)
                    rtext1.blit(rtext, (height_plus, width_plus + line_count * _height))
                    line_count += 1
                pygame.image.save(rtext1, imagePath_huge + "\\" + str(count).zfill(2) + ".png")
                Print(u"保存图片:\t\t\t\t\t\t\t" + imagePath_huge + "\\" + str(count).zfill(2) + ".png")
                width_save = floor(picEdge*dst_scale)
                height_save = floor(picEdge*dst_scale*rtext1.get_height()/rtext1.get_width())
                rtext2 = pygame.transform.smoothscale(rtext1, (width_save, height_save))
                rtext3 = pygame.Surface((picEdge*dst_scale, picEdge*dst_scale), pygame.SRCALPHA)
                rtext3.set_alpha(0)
                rtext3.blit(rtext2, (0, (picEdge*dst_scale - rtext2.get_height())/2))
                pygame.image.save(rtext3, imagePath_big + "\\" + str(count).zfill(2) + ".png")
                Print(u"保存图片:\t\t\t\t\t\t\t" + imagePath_big + "\\" + str(count).zfill(2) + ".png")
                rtext2 = pygame.transform.smoothscale(rtext3, (floor(rtext3.get_width()/2), floor(rtext3.get_height()/2)))
                pygame.image.save(rtext2, imagePath_small + "\\" + str(count).zfill(2) + ".png")
                Print(u"保存图片:\t\t\t\t\t\t\t" + imagePath_small + "\\" + str(count).zfill(2) + ".png")
                count += 1

__DEBUG__ = True
def Print(string):
    print(string) if __DEBUG__ else None
generate_pic(True)
generate_pic(False)
