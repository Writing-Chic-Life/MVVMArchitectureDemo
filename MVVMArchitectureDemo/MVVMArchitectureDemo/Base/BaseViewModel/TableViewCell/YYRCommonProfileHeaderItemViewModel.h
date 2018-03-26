//
//  YYRCommonProfileHeaderItemViewModel.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//
//  用户信息的ItemViewModel

#import "YYRCommonItemViewModel.h"
#import "YYRUser.h"

@interface YYRCommonProfileHeaderItemViewModel : YYRCommonItemViewModel

/// 用户头像
@property (nonatomic, readonly, strong) YYRUser *user;


- (instancetype)initViewModelWithUser:(YYRUser *)user;

@end
