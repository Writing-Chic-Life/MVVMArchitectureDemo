//
//  UITextField+YYRExtension.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (YYRExtension)

/// 限制最大长度
- (void)yyr_limitMaxLength:(NSInteger)maxLength;

@end
