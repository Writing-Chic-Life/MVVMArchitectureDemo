//
//  YYRCommonSwitchItemViewModel.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRCommonSwitchItemViewModel.h"

@implementation YYRCommonSwitchItemViewModel

- (void)setOff:(BOOL)off {
    _off = off;
    
    [YYRPreferenceSettingHelper setBool:off forKey:self.key];
}

- (void)setKey:(NSString *)key {
    [super setKey:key];
    
    _off = [YYRPreferenceSettingHelper boolForKey:key];
}

@end
