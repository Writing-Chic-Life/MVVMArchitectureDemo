//
//  MBProgressHUD+YYRExtension.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "MBProgressHUD+YYRExtension.h"
#import "NSError+YYRExtension.h"

@implementation MBProgressHUD (YYRExtension)

#pragma mark - Added To  window
/// 提示信息
+ (MBProgressHUD *)yyr_showTips:(NSString *)tipStr {
    return [self yyr_showTips:tipStr addedToView:nil];
}

/// 提示错误
+ (MBProgressHUD *)yyr_showErrorTips:(NSError *)error {
    return [self yyr_showErrorTips:error addedToView:nil];
}

/// 进度view
+ (MBProgressHUD *)yyr_showProgressHUD:(NSString *)titleStr {
    return [self yyr_showProgressHUD:titleStr addedToView:nil];
}

/// hide hud
+ (void)yyr_hideHUD {
    [self yyr_hideHUDForView:nil];
}


#pragma mark - Added To Special View
/// 提示信息
+ (MBProgressHUD *)yyr_showTips:(NSString *)tipStr addedToView:(UIView *)view {
    return [self _showHUDWithTips:tipStr isAutomaticHide:YES addedToView:view];
}

/// 提示错误
+ (MBProgressHUD *)yyr_showErrorTips:(NSError *)error addedToView:(UIView *)view {
    return [self _showHUDWithTips:[self yyr_tipsFromError:error] isAutomaticHide:YES addedToView:view];
}


/// 进度view
+ (MBProgressHUD *)yyr_showProgressHUD:(NSString *)titleStr addedToView:(UIView *)view {
    return [self _showHUDWithTips:titleStr isAutomaticHide:NO addedToView:view];
}

// 隐藏HUD
+ (void)yyr_hideHUDForView:(UIView *)view {
    [self hideHUDForView:[self _willShowingToViewWithSourceView:view] animated:YES];
}

#pragma mark - 辅助方法
/// 获取将要显示的view
+ (UIView *)_willShowingToViewWithSourceView:(UIView *)sourceView {
    if (sourceView) return sourceView;
    
    sourceView =  [[UIApplication sharedApplication].delegate window];
    if (!sourceView) sourceView = [[[UIApplication sharedApplication] windows] lastObject];
    
    return sourceView;
}

+ (instancetype )_showHUDWithTips:(NSString *)tipStr isAutomaticHide:(BOOL) isAutomaticHide addedToView:(UIView *)view {
    view = [self _willShowingToViewWithSourceView:view];
    
    /// 也可以show之前 hid掉之前的
    [self yyr_hideHUDForView:view];
    
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.mode = isAutomaticHide?MBProgressHUDModeText:MBProgressHUDModeIndeterminate;
    HUD.animationType = MBProgressHUDAnimationZoom;
    HUD.label.font = isAutomaticHide?YYRMediumFont(17.0f):YYRMediumFont(14.0f);
    HUD.label.textColor = [UIColor whiteColor];
    HUD.contentColor = [UIColor whiteColor];
    HUD.label.text = tipStr;
    HUD.bezelView.layer.cornerRadius = 8.0f;
    HUD.bezelView.layer.masksToBounds = YES;
    HUD.bezelView.color = YYRColorAlpha(0, 0, 0, .6f);
    HUD.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    HUD.minSize =isAutomaticHide?CGSizeMake([UIScreen mainScreen].bounds.size.width-96.0f, 60):CGSizeMake(120, 120);
    HUD.margin = 18.2f;
    HUD.removeFromSuperViewOnHide = YES;
    if (isAutomaticHide) [HUD hideAnimated:YES afterDelay:1.0f];
    return HUD;
}


#pragma mark - 辅助属性
+ (NSString *)yyr_tipsFromError:(NSError *)error {
    return [NSError yyr_tipsFromError:error];
}

@end
