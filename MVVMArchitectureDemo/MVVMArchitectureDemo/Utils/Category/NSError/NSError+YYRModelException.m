//
//  NSError+YYRModelException.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "NSError+YYRModelException.h"

// The domain for errors originating from YYRModel.
static NSString * const YYRModelErrorDomain = @"YYRModelErrorDomain";

// An exception was thrown and caught.
static const NSInteger YYRModelErrorExceptionThrown = 1;

// Associated with the NSException that was caught.
static NSString * const YYRModelThrownExceptionErrorKey = @"YYRModelThrownException";

@implementation NSError (YYRModelException)

+ (instancetype)yyr_modelErrorWithException:(NSException *)exception {
    NSParameterAssert(exception != nil);
    
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: exception.description,
                               NSLocalizedFailureReasonErrorKey: exception.reason,
                               YYRModelThrownExceptionErrorKey: exception
                               };
    
    return [NSError errorWithDomain:YYRModelErrorDomain code:YYRModelErrorExceptionThrown userInfo:userInfo];
}

@end
