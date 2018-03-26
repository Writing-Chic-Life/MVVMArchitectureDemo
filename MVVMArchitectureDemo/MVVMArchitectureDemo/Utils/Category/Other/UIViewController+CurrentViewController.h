//
//  UIViewController+CurrentViewController.h
//  SISSAPP
//
//  Created by 袁应荣 on 2017/9/21.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CurrentViewController)


/**
 获取Window当前显示的ViewController

 @return VC
 */
+ (UIViewController *)currentViewController;

@end
