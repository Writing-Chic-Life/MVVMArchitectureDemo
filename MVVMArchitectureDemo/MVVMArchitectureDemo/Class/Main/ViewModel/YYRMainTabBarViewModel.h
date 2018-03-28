//
//  YYRMainTabBarViewModel.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/27.
//  Copyright © 2018年 袁应荣. All rights reserved.
//  主界面的视图的视图模型

#import "YYRTabBarViewModel.h"
#import "YYRHomePageViewModel.h"
#import "YYRContactsViewModel.h"
#import "YYRDiscoverViewModel.h"
#import "YYRProfileViewModel.h"

@interface YYRMainTabBarViewModel : YYRTabBarViewModel

/// The view model of `Home` interface.
@property (nonatomic, strong, readonly) YYRHomePageViewModel *homepageViewModel;

/// The view model of `contacts` interface.
@property (nonatomic, strong, readonly) YYRContactsViewModel *contactsViewModel;

/// The view model of `discover` interface.
@property (nonatomic, strong, readonly) YYRDiscoverViewModel *discoverViewModel;

/// The view model of `Profile` interface.
@property (nonatomic, strong, readonly) YYRProfileViewModel *profileViewModel;

@end
