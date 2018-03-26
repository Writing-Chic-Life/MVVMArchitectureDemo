//
//  YYRCommonItemViewModel.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRCommonItemViewModel.h"

@implementation YYRCommonItemViewModel

+ (instancetype)itemViewModelWithTitle:(NSString *)title icon:(NSString *)icon {
    YYRCommonItemViewModel *item = [[self alloc] init];
    item.title = title;
    item.icon = icon;
    return item;
}

+ (instancetype)itemViewModelWithTitle:(NSString *)title {
    return [self itemViewModelWithTitle:title icon:nil];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _selectionStyle = UITableViewCellSelectionStyleGray;
        _rowHeight = 44.0f;
    }
    return self;
}

@end
