//
//  YYRNavigationController.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//  所有自定义导航栏视图控制器的基类

#import <UIKit/UIKit.h>

@interface YYRNavigationController : UINavigationController

/// 显示导航栏的细线
- (void)showNavigationBottomLine;
/// 隐藏导航栏的细线
- (void)hideNavigationBottomLine;

@end
