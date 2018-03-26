//
//  YYRTabBarController.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//  自定义`TabBarController` ,这里将`UITabBarController`作为自己的子控制器，其目的就是为了保证的继承的连续性，否则像平常我们自定义`UITabBarController`都是继承`UITabBarController`.

#import "YYRViewController.h"

@interface YYRTabBarController : YYRViewController<UITabBarControllerDelegate>

/// The `tabBarController` instance
@property (nonatomic, readonly, strong) UITabBarController *tabBarController;

@end
