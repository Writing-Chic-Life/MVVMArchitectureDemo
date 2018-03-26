//
//  YYRWebViewModel.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRWebViewModel.h"

@implementation YYRWebViewModel

- (instancetype)initWithServices:(id<YYRViewModelServices>)services params:(NSDictionary *)params {
    self = [super initWithServices:services params:params];
    if (self) {
        self.request = params[YYRViewModelRequestKey];
    }
    return self;
}

@end
