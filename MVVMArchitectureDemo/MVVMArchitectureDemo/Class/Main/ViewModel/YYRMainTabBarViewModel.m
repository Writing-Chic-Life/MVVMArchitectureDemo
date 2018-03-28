//
//  YYRMainTabBarViewModel.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/27.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRMainTabBarViewModel.h"

@interface YYRMainTabBarViewModel ()

/// The view model of `Home` interface.
@property (nonatomic, strong, readwrite) YYRHomePageViewModel *homepageViewModel;

/// The view model of `contacts` interface.
@property (nonatomic, strong, readwrite) YYRContactsViewModel *contactsViewModel;

/// The view model of `discover` interface.
@property (nonatomic, strong, readwrite) YYRDiscoverViewModel *discoverViewModel;

/// The view model of `Profile` interface.
@property (nonatomic, strong, readwrite) YYRProfileViewModel *profileViewModel;

@end
@implementation YYRMainTabBarViewModel

- (void)initialize {
    [super initialize];
    
    self.homepageViewModel  = [[YYRHomePageViewModel alloc] initWithServices:self.services params:nil];
    self.contactsViewModel   = [[YYRContactsViewModel alloc] initWithServices:self.services params:nil];
    self.discoverViewModel   = [[YYRDiscoverViewModel alloc] initWithServices:self.services params:nil];
    self.profileViewModel    = [[YYRProfileViewModel alloc] initWithServices:self.services params:nil];
}

@end
