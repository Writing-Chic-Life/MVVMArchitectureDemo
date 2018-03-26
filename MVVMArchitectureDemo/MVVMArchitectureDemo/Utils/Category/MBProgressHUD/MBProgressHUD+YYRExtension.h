//
//  MBProgressHUD+YYRExtension.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (YYRExtension)

/// in window
/// 提示信息
+ (MBProgressHUD *)yyr_showTips:(NSString *)tipStr;

/// 提示错误
+ (MBProgressHUD *)yyr_showErrorTips:(NSError *)error;

/// 进度view
+ (MBProgressHUD *)yyr_showProgressHUD:(NSString *)titleStr;

/// 隐藏hud
+ (void)yyr_hideHUD;



/// in special view
/// 提示信息
+ (MBProgressHUD *)yyr_showTips:(NSString *)tipStr addedToView:(UIView *)view;

/// 提示错误
+ (MBProgressHUD *)yyr_showErrorTips:(NSError *)error addedToView:(UIView *)view;

/// 进度view
+ (MBProgressHUD *)yyr_showProgressHUD:(NSString *)titleStr addedToView:(UIView *)view;

/// 隐藏hud
+ (void)yyr_hideHUDForView:(UIView *)view;

@end
