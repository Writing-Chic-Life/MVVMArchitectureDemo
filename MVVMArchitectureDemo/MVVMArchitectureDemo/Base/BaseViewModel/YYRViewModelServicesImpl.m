//
//  YYRViewModelServicesImpl.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRViewModelServicesImpl.h"

@implementation YYRViewModelServicesImpl

@synthesize client = _client;

- (instancetype)init {
    self = [super init];
    if (self) {
        _client = [YYRHTTPService sharedInstance];
    }
    return self;
}


#pragma mark - YYRNavigationProtocol empty operation
- (void)pushViewModel:(YYRViewModel *)viewModel animated:(BOOL)animated {}

- (void)popViewModelAnimated:(BOOL)animated {}

- (void)popToRootViewModelAnimated:(BOOL)animated {}

- (void)presentViewModel:(YYRViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)resetRootViewModel:(YYRViewModel *)viewModel {}


@end
