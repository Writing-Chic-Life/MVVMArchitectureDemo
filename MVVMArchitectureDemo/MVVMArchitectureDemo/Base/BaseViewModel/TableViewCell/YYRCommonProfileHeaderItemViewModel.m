//
//  YYRCommonProfileHeaderItemViewModel.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRCommonProfileHeaderItemViewModel.h"

@interface YYRCommonProfileHeaderItemViewModel ()

/// 用户头像
@property (nonatomic, readwrite, strong) YYRUser *user;
@end
@implementation YYRCommonProfileHeaderItemViewModel

- (instancetype)initViewModelWithUser:(YYRUser *)user {
    if (self = [super init]) {
        self.user = user;
    }
    return self;
}

@end
