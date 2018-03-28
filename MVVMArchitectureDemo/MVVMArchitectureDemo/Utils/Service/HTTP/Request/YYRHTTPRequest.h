//
//  YYRHTTPRequest.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYRURLParameters.h"
#import "RACSignal+YYRHTTPServiceAdditions.h"

@interface YYRHTTPRequest : NSObject

/// 请求参数
@property (nonatomic, readonly, strong) YYRURLParameters *urlParameters;
/**
 获取请求类
 @param parameters  参数模型
 @return 请求类
 */
+ (instancetype)requestWithParameters:(YYRURLParameters *)parameters;

@end
/// YYRHTTPService的分类
@interface YYRHTTPRequest (YYRHTTPService)
/// 入队
- (RACSignal *) enqueueResultClass:(Class /*subclass of YYRObject*/) resultClass;

@end
