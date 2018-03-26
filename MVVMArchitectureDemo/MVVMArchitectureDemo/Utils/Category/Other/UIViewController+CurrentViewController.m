//
//  UIViewController+CurrentViewController.m
//  SISSAPP
//
//  Created by 袁应荣 on 2017/9/21.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import "UIViewController+CurrentViewController.h"

@implementation UIViewController (CurrentViewController)

// 获取Window当前显示的ViewController
+ (UIViewController *)currentViewController {
    //获得当前活动窗口的根视图
    UIViewController* vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1) {
        //根据不同的页面切换方式，逐步取得最上层的viewController
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}


@end
