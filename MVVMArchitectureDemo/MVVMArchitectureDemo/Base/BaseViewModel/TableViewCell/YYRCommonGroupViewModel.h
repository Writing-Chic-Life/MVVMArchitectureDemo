//
//  YYRCommonGroupViewModel.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//
//  组视图模型

#import <Foundation/Foundation.h>

@interface YYRCommonGroupViewModel : NSObject

/// 组头
@property (nonatomic, copy) NSString *header;
/// headerHeight defalult is .001
@property (nonatomic, readwrite, assign) CGFloat headerHeight;
/// 组尾
@property (nonatomic, copy) NSString *footer;
/// footerHeight defalult is 21
@property (nonatomic, readwrite, assign) CGFloat footerHeight;
/// 里面装着都是 MHCommonItemViewModel 以及其子类
@property (nonatomic, strong) NSArray *itemViewModels;

+ (instancetype)groupViewModel;

@end
