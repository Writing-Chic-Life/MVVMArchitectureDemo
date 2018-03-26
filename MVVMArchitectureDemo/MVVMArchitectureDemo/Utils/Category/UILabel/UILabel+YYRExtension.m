//
//  UILabel+YYRExtension.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "UILabel+YYRExtension.h"

@implementation UILabel (YYRExtension)

+ (instancetype)yyr_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor {
    return [self yyr_labelWithText:text font:[UIFont systemFontOfSize:fontSize] textColor:textColor];
}


+ (instancetype)yyr_labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor {
    UILabel *label = [[self alloc] init];
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    label.numberOfLines = 0;
    [label sizeToFit];
    return label;
}

@end
