//
//  RACSignal+YYRHTTPServiceAdditions.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "RACSignal+YYRHTTPServiceAdditions.h"
#import "YYRHTTPResponse.h"

@implementation RACSignal (YYRHTTPServiceAdditions)

- (RACSignal *)yyr_parsedResults {
    return [self map:^(YYRHTTPResponse *response) {
        NSAssert([response isKindOfClass:YYRHTTPResponse.class], @"Expected %@ to be an YYRHTTPResponse.", response);
        return response.parsedResult;
    }];
}

@end
