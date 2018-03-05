//
//  UIColor+KOAddition.m
//  KOWeiBo
//
//  Created by Korune on 2018/3/5.
//  Copyright © 2018年 Korune. All rights reserved.
//

#import "UIColor+KOAddition.h"

@implementation UIColor (KOAddition)

+ (instancetype)ko_colorWithHex:(uint32_t)hex
{
    uint8_t r = (hex & 0xff0000) >> 16;
    uint8_t g = (hex & 0x00ff00) >> 8;
    uint8_t b = hex & 0x0000ff;
    
   return [UIColor colorWithRed:r / 255.0
                          green:g / 255.0
                           blue:b / 255.0
                          alpha:1.0];
}

@end
