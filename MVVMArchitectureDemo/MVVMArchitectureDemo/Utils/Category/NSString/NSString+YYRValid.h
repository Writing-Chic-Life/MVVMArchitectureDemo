//
//  NSString+YYRValid.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YYRValid)

/// 检测字符串是否包含中文
+ (BOOL)yyr_isContainChinese:(NSString *)str;

/// 整形
+ (BOOL)yyr_isPureInt:(NSString *)string;

/// 浮点型
+ (BOOL)yyr_isPureFloat:(NSString *)string;

/// 有效的手机号码
+ (BOOL)yyr_isValidMobile:(NSString *)str;

/// 纯数字
+ (BOOL)yyr_isPureDigitCharacters:(NSString *)string;

/// 字符串为字母或者数字
+ (BOOL)yyr_isValidCharacterOrNumber:(NSString *)str;

/// 判断字符串全是空格or空
+ (BOOL)yyr_isEmpty:(NSString *) str;

/// 是否是正确的邮箱
+ (BOOL)yyr_isValidEmail:(NSString *)email;

/// 是否是正确的QQ
+ (BOOL)yyr_isValidQQ:(NSString *)QQ;


@end
