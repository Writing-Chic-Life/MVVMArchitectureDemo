//
//  RACSignal+YYRHTTPServiceAdditions.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <ReactiveObjC/ReactiveObjC.h>

// Convenience category to retreive parsedResults from YYRHTTPResponses.
@interface RACSignal (YYRHTTPServiceAdditions)

// This method assumes that the receiver is a signal of YYRHTTPResponses.
//
// Returns a signal that maps the receiver to become a signal of
// YYRHTTPResponses.parsedResult.
- (RACSignal *)yyr_parsedResults;

@end
