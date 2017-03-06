#-*- coding: utf-8 -*-
import os
import pygame as pg
from pygame import *

def AAfilledRoundedRect(surface,rect,color,radius=0.4):

    """
    AAfilledRoundedRect(surface,rect,color,radius=0.4)

    surface : destination
    rect    : rectangle
    color   : rgb or rgba
    radius  : 0 <= radius <= 1
    """

    rect         = Rect(rect)
    color        = Color(*color)
    alpha        = color.a
    color.a      = 0
    pos          = rect.topleft
    rect.topleft = 0,0
    rectangle    = Surface(rect.size,SRCALPHA)

    circle       = Surface([min(rect.size)*3]*2,SRCALPHA)
    draw.ellipse(circle,(0,0,0),circle.get_rect(),0)
    circle       = transform.smoothscale(circle,[int(min(rect.size)*radius)]*2)

    radius              = rectangle.blit(circle,(0,0))
    radius.bottomright  = rect.bottomright
    rectangle.blit(circle,radius)
    radius.topright     = rect.topright
    rectangle.blit(circle,radius)
    radius.bottomleft   = rect.bottomleft
    rectangle.blit(circle,radius)

    rectangle.fill((0,0,0),rect.inflate(-radius.w,0))
    rectangle.fill((0,0,0),rect.inflate(0,-radius.h))

    rectangle.fill(color,special_flags=BLEND_RGBA_MAX)
    rectangle.fill((255,255,255,alpha),special_flags=BLEND_RGBA_MIN)

    return surface.blit(rectangle,pos)

pg.init()
count = 0
font = pg.font.Font(os.path.join("fonts", "wqy-microhei.ttc"), 28)
for line in open("1.txt", mode='r', encoding='UTF-8'):
    line = line.strip('\n')
    count += 1
    rtext1 = font.render(line, True, (255, 255, 255), (200, 200, 200))
    rtext2 = pg.Surface((rtext1.get_width() + 23, 45))
    rtext2.fill((200, 200, 200))
    rtext3 = display.set_mode(rtext2.get_size())
    rtext3.fill(-1)
    AAfilledRoundedRect(rtext3, rtext3.get_rect(), (200, 200, 200, 255), 0.5)
    rtext3.blit(rtext1, (11, 7))
    rtext3.convert_alpha()
    rtext3.set_alpha(255)
    pg.image.save(rtext3, ""+ str(count) + ".jpg")


