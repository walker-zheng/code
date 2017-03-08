#! /usr/bin/python
# -*- coding: utf-8 -*-

import os
import pygame
import codecs


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


pygame.init()
fontPath = "fonts"
text = u'获取测试文本长度哈哈'
line_len = len(text)
fontSize = 15
width_plus = 10
height_plus = 10
for _,_,filenames in os.walk(fontPath):
    fontCount = 0
    for filename in filenames:
        font = pygame.font.Font(os.path.join("fonts", filename), fontSize)
        _rtext = font.render(text, False, (255, 255, 255), (204, 204, 204))
        _width, _height = _rtext.get_size()
        while _height < 40:
            fontSize += 1
            font = pygame.font.Font(os.path.join("fonts", filename), fontSize)
            _rtext = font.render(text, False, (255, 255, 255), (204, 204, 204))
            _width, _height = _rtext.get_size()
        fontCount += 1
        width_one = _width/len(text)
        line_len = 300 /width_one
        #imagePath = "images/" + str(fontCount)
        imagePath = "images/" + os.path.splitext(filename)[0]
        if not os.path.exists(imagePath):
            os.mkdir(imagePath)
        count = 0
        for line in codecs.open("1.txt", mode='r', encoding='utf-8'):
            line = line.strip("\n")
            if len(line) == 0:
                continue
            lines = [line]
            if len(line) > line_len:
                lines = splitByLen(line, line_len)
            rtext1 = pygame.Surface((width_one * len(lines[0]) + width_plus * 2, _height * len(lines) + height_plus * 2), pygame.SRCALPHA)
            rtext1.set_alpha(0)
            AAfilledRoundedRect(rtext1, rtext1.get_rect(), (204, 204, 204), 0.5)
            line_count = 0
            for every in lines:
                ##  rtext = pygame.display.set_mode((300,300))
                rtext = font.render(every, False, (255, 255, 255), (204, 204, 204))
                rtext1.blit(rtext, (height_plus, width_plus + line_count * _height))
                line_count += 1
            pygame.image.save(rtext1, imagePath + "/" + str(count) + ".png")
            count += 1