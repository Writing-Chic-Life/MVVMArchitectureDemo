//
//  AppDelegate.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYRNavigationControllerStack.h"
#import "YYRViewModelServicesImpl.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

/// 窗口
@property (strong, nonatomic) UIWindow *window;

/// APP管理的导航栏的堆栈
@property (nonatomic, readonly, strong) YYRNavigationControllerStack *navigationControllerStack;

/// 获取AppDelegate
+ (AppDelegate *)sharedDelegate;

/// 是否已经弹出键盘 主要用于微信朋友圈的判断
@property (nonatomic, readwrite, assign , getter = isShowKeyboard) BOOL showKeyboard;


@end

