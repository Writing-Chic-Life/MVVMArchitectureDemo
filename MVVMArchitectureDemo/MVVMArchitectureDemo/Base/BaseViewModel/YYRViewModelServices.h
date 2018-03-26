//
//  YYRViewModelServices.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//
//  视图模型服务层测协议 （导航栏操作的服务层 + 网络的服务层）

#import <Foundation/Foundation.h>
#import "YYRNavigationProtocol.h"
#import "YYRHTTPService.h"

@protocol YYRViewModelServices <NSObject,YYRNavigationProtocol>

/// A reference to YYRHTTPService instance.
/// 全局通过这个Client来请求数据，处理用户信息
@property (nonatomic, readonly, strong) YYRHTTPService *client;

@end
