//
//  YYRCommonLabelItemViewModel.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//
//  右边显示的内容

#import "YYRCommonItemViewModel.h"

@interface YYRCommonLabelItemViewModel : YYRCommonItemViewModel

/// 右边label显示的内容 
@property (nonatomic, readwrite, copy) NSString *text;

@end
