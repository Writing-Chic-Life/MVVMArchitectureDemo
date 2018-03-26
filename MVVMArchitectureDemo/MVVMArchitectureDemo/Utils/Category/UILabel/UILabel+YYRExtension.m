//
//  UILabel+YYRExtension.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "UILabel+YYRExtension.h"

@implementation UILabel (YYRExtension)

+ (instancetype)yyr_labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor {
    UILabel *label = [[self alloc] init];
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    label.numberOfLines = 0;
    [label sizeToFit];
    return label;
}

+ (instancetype)yyr_labelWithText:(NSString *)text {
    
    return [self yyr_labelWithText:text fontSize:14 textColor:[UIColor darkGrayColor] alignment:NSTextAlignmentLeft];
}

+ (instancetype)yyr_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize {
    
    return [self yyr_labelWithText:text fontSize:fontSize textColor:[UIColor darkGrayColor] alignment:NSTextAlignmentLeft];
}

+ (instancetype)yyr_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor {
    
    return [self yyr_labelWithText:text fontSize:fontSize textColor:textColor alignment:NSTextAlignmentLeft];
}

+ (instancetype)yyr_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor alignment:(NSTextAlignment)alignment {
    
    UILabel *label = [[self alloc] init];
    
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = textColor;
    label.numberOfLines = 0;
    label.textAlignment = alignment;
    
    [label sizeToFit];
    
    return label;
}

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}

@end
