//
//  YYRCommonValueItemViewModel.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//
//  需要存储数据的item都继承自它

#import "YYRCommonItemViewModel.h"

@interface YYRCommonValueItemViewModel : YYRCommonItemViewModel

/// 存储数据用的key
@property (nonatomic, readwrite, copy) NSString *key;

@end
