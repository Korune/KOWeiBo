//
//  UIButton+KOAddition.h
//  KOWeiBo
//
//  Created by Korune on 2018/2/25.
//  Copyright © 2018年 Korune. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (KOAddition)


/**
  创建文本按钮

 @param title            标题文字
 @param fontSize         字体大小
 @param normalColor      默认颜色
 @param highlightedColor 高亮颜色
 @return 按钮
 */

+ (instancetype)ko_textButtonWithTitle:(NSString *)title
                              fontSize:(CGFloat)fontSize
                           normalColor:(UIColor *)normalColor
                      highlightedColor:(UIColor *)highlightedColor;

@end
