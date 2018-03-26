//
//  UILabel+YYRExtension.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YYRExtension)

/// 创建文本标签
///
/// @param text     文本
/// @param fontSize 字体大小
/// @param textColor    颜色
///
/// @return UILabel
+ (instancetype)yyr_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor;
+ (instancetype)yyr_labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor;

@end
