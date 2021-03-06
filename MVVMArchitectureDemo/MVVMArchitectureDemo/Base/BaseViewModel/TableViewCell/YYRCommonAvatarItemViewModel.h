//
//  YYRCommonAvatarItemViewModel.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//
//  头像

#import "YYRCommonItemViewModel.h"

@interface YYRCommonAvatarItemViewModel : YYRCommonItemViewModel

/// 用户头像
@property (nonatomic, readwrite, copy) NSString *avatar;

@end
