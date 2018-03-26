//
//  YYRHTTPResponse.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRHTTPResponse.h"
#import "YYRHTTPServiceConstant.h"

@interface YYRHTTPResponse ()

/// The parsed YYRObject object corresponding to the API response.
/// The developer need care this data
@property (nonatomic, readwrite, strong) id parsedResult;
/// 自己服务器返回的状态码
@property (nonatomic, readwrite, assign) YYRHTTPResponseCode code;
/// 自己服务器返回的信息
@property (nonatomic, readwrite, copy) NSString *msg;
@end

@implementation YYRHTTPResponse

- (instancetype)initWithResponseObject:(id)responseObject parsedResult:(id)parsedResult
{
    self = [super init];
    if (self) {
        self.parsedResult = parsedResult ?:NSNull.null;
        self.code = [responseObject[YYRHTTPServiceResponseCodeKey] integerValue];
        self.msg = responseObject[YYRHTTPServiceResponseMsgKey];
    }
    return self;
}

@end
