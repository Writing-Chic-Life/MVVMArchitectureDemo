//
//  FBKVOController+YYRExtension.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "FBKVOController+YYRExtension.h"

@implementation FBKVOController (YYRExtension)

- (void)yyr_observe:(id)object keyPath:(NSString *)keyPath block:(FBKVONotificationBlock)block {
    [self observe:object keyPath:keyPath options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew block:block];
}

- (void)yyr_observe:(id)object keyPath:(NSString *)keyPath action:(SEL)action {
    [self observe:object keyPath:keyPath options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew action:action];
}

@end
