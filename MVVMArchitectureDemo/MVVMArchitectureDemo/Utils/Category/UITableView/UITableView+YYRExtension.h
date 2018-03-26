//
//  UITableView+YYRExtension.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (YYRExtension)

/**
 * 使用以下两个方法注册的cell，identifier和类名保持一致
 * 推荐使用类名做cell的标识符
 * 使用该方法获取identifier字符串：
 * NSString *identifier = NSStringFromClass([UITableViewCell class])
 */
- (void)yyr_registerCell:(Class)cls;
- (void)yyr_registerNibCell:(Class)cls;

- (void)yyr_registerCell:(Class)cls forCellReuseIdentifier:(NSString *)reuseIdentifier;
- (void)yyr_registerNibCell:(Class)cls forCellReuseIdentifier:(NSString *)reuseIdentifier;

@end
