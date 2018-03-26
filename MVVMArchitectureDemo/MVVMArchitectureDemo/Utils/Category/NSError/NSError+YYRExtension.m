//
//  NSError+YYRExtension.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "NSError+YYRExtension.h"
#import "YYRHTTPService.h"

@implementation NSError (YYRExtension)

+ (NSString *)yyr_tipsFromError:(NSError *)error{
    if (!error) return nil;
    NSString *tipStr = nil;
    /// 这里需要处理HTTP请求的错误
    if (error.userInfo[YYRHTTPServiceErrorDescriptionKey]) {
        tipStr = [error.userInfo objectForKey:YYRHTTPServiceErrorDescriptionKey];
    }else if (error.userInfo[YYRHTTPServiceErrorMessagesKey]) {
        tipStr = [error.userInfo objectForKey:YYRHTTPServiceErrorMessagesKey];
    }else if (error.domain) {
        tipStr = error.localizedFailureReason;
    } else {
        tipStr = error.localizedDescription;
    }
    return tipStr;
}

@end
