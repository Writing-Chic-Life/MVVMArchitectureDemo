//
//  NSObject+YYRExtension.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YYRExtension)

/// 获取 [from to] 之间的数据
+ (NSInteger) yyr_randomNumberWithFrom:(NSInteger)from to:(NSInteger)to;

/// 根据获取到的
- (void)yyr_convertNotification:(NSNotification *_Nullable)notification completion:(void (^ __nullable)(CGFloat duration, UIViewAnimationOptions options, CGFloat keyboardH))completion;


#pragma mark - Get..
/// Get class
- (BOOL)yyr_isStringClass;
- (BOOL)yyr_isNumberClass;
- (BOOL)yyr_isArrayClass;
- (BOOL)yyr_isDictionaryClass;
- (BOOL)yyr_isStringOrNumberClass;
- (BOOL)yyr_isNullOrNil;
- (BOOL)yyr_isExist;

/// Get value
- (NSString *_Nullable)yyr_stringValueExtension;

@end
