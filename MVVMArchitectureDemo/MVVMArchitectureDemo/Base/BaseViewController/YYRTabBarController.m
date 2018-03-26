//
//  YYRTabBarController.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRTabBarController.h"
#import "YYRTabBar.h"

@interface YYRTabBarController ()

/// tabBarController
@property (nonatomic, strong, readwrite) UITabBarController *tabBarController;

@end

@implementation YYRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController = [[UITabBarController alloc] init];
    /// 添加子控制器
    [self.view addSubview:self.tabBarController.view];
    [self addChildViewController:self.tabBarController];
    [self.tabBarController didMoveToParentViewController:self];
    
    // kvc替换系统的tabBar
    YYRTabBar *tabbar = [[YYRTabBar alloc] init];
    //kvc实质是修改了系统的_tabBar
    [self.tabBarController setValue:tabbar forKeyPath:@"tabBar"];
    
}

#pragma mark - Ovveride
- (BOOL)shouldAutorotate {
    return self.tabBarController.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.tabBarController.selectedViewController.supportedInterfaceOrientations;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.tabBarController.selectedViewController.preferredStatusBarStyle;
}

- (BOOL)prefersStatusBarHidden {
    return self.tabBarController.selectedViewController.prefersStatusBarHidden;
}

@end
