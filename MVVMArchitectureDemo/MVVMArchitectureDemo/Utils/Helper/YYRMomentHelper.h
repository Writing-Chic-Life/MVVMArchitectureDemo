//
//  YYRMomentHelper.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//  微信朋友圈工具类

#import <Foundation/Foundation.h>

@interface YYRMomentHelper : NSObject

/// 微信用到的 dateFormatter
+ (NSDateFormatter *)dateFormatter;
/// 时间转化
+ (NSString *)createdAtTimeWithSourceDate:(NSDate *)sourceDate;
/// 电话号码正则
+ (NSRegularExpression *)regexPhoneNumber;
/// 链接正则
+ (NSRegularExpression *)regexLinkUrl;

/// 关闭 微信朋友圈的一些弹出事件 （评论和点赞view ， 键盘）背景高亮view....
+ (void)hideAllPopViewWithAnimated:(BOOL)animated;

@end
