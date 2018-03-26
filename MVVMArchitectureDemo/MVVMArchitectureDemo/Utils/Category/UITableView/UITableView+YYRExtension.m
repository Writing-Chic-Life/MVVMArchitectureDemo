//
//  UITableView+YYRExtension.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "UITableView+YYRExtension.h"

@implementation UITableView (YYRExtension)

- (void)yyr_registerCell:(Class)cls {
    
    [self yyr_registerCell:cls forCellReuseIdentifier:NSStringFromClass(cls)];
}
- (void)yyr_registerCell:(Class)cls forCellReuseIdentifier:(NSString *)reuseIdentifier {
    [self registerClass:cls forCellReuseIdentifier:reuseIdentifier];
}



- (void)yyr_registerNibCell:(Class)cls {
    [self yyr_registerNibCell:cls forCellReuseIdentifier:NSStringFromClass(cls)];
}
- (void)yyr_registerNibCell:(Class)cls forCellReuseIdentifier:(NSString *)reuseIdentifier {
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cls) bundle:nil] forCellReuseIdentifier:reuseIdentifier];
}

@end
