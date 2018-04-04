//
//  YYRLoginBaseViewModel.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/30.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRLoginBaseViewModel.h"

@implementation YYRLoginBaseViewModel

- (void)initialize {
    [super initialize];
    
    /// 隐藏导航栏的细线
    self.prefersNavigationBarBottomLineHidden = YES;
}

@end
