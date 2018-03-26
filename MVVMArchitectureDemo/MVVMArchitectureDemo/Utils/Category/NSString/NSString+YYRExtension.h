//
//  NSString+YYRExtension.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YYRExtension)

/// 消除收尾空格
- (NSString *)yyr_removeBothEndsWhitespace;
/// 消除收尾空格+换行符
- (NSString *)yyr_removeBothEndsWhitespaceAndNewline;
// 消除收尾空格
- (NSString *)yyr_trimWhitespace;
/// 编码
- (NSString *)yyr_URLEncoding;
// 消除所有空格
- (NSString *)yyr_trimAllWhitespace;

@end
