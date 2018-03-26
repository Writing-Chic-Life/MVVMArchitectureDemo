//
//  UIView+YYRExtension.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YYRExtension)

/**
 * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)yyr_isShowingOnKeyWindow;

/**
 * xib创建的view
 */
+ (instancetype)yyr_viewFromXib;

/**
 * xib创建的view
 */
+ (instancetype)yyr_viewFromXibWithFrame:(CGRect)frame;

/**
 * xib中显示的属性
 */
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable BOOL masksToBounds;

@end
