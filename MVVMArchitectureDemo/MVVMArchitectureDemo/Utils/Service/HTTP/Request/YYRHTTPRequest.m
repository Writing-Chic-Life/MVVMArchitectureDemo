//
//  YYRHTTPRequest.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRHTTPRequest.h"
#import "YYRHTTPService.h"

@interface YYRHTTPRequest ()

/// 请求参数
@property (nonatomic, readwrite, strong) YYRURLParameters *urlParameters;

@end

@implementation YYRHTTPRequest

+ (instancetype)requestWithParameters:(YYRURLParameters *)parameters {
    return [[self alloc] initRequestWithParameters:parameters];
}

- (instancetype)initRequestWithParameters:(YYRURLParameters *)parameters {
    
    self = [super init];
    if (self) {
        self.urlParameters = parameters;
    }
    return self;
}


@end

/// 网络服务层分类 方便YYRHTTPRequest 主动发起请求
@implementation YYRHTTPRequest (YYRHTTPService)
/// 请求数据
- (RACSignal *)enqueueResultClass:(Class /*subclass of YYRObject*/)resultClass {
    return [[YYRHTTPService sharedInstance] enqueueRequest:self resultClass:resultClass];
}
@end
