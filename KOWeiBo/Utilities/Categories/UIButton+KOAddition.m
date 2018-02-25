//
//  UIButton+KOAddition.m
//  KOWeiBo
//
//  Created by Korune on 2018/2/25.
//  Copyright © 2018年 Korune. All rights reserved.
//

#import "UIButton+KOAddition.h"

@implementation UIButton (KOAddition)

+ (instancetype)ko_textButtonWithTitle:(NSString *)title
                              fontSize:(CGFloat)fontSize
                           normalColor:(UIColor *)normalColor
                      highlightedColor:(UIColor *)highlightedColor
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    [button sizeToFit];
    
    return button;
}

@end
