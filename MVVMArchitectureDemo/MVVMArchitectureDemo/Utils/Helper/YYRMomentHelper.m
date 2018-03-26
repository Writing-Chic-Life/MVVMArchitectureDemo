//
//  YYRMomentHelper.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRMomentHelper.h"

@implementation YYRMomentHelper

+ (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *fmt = nil;
    /// 由于NSDateFormatter 有一定的性能问题 故全局共享一个
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fmt = [[NSDateFormatter alloc] init];
        fmt.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
        ///  真机调试的时候，必须加上这句
        fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    });
    return fmt;
}

/// 时间转化
+ (NSString *)createdAtTimeWithSourceDate:(NSDate *)sourceDate {
    if (YYRObjectIsNil(sourceDate)) return @"";
    // 判断是否为今年
    if (sourceDate.yyr_isThisYear) {
        if (sourceDate.yyr_isToday) { // 今天
            NSDateComponents *cmps = [sourceDate yyr_deltaWithNow];
            if (cmps.hour >= 1) { // 至少是1小时前发的
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) { // 1~59分钟之前发的
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            }else { // 1分钟内发的
                return @"刚刚";
            }
        } else if (sourceDate.yyr_isYesterday) { // 昨天
            self.dateFormatter.dateFormat = @"昨天 HH:mm";
            return [self.dateFormatter stringFromDate:sourceDate];
        } else { // 至少是前天
            [self dateFormatter].dateFormat = @"MM-dd HH:mm";
            return [self.dateFormatter stringFromDate:sourceDate];
        }
    } else { // 非今年
        self.dateFormatter.dateFormat = @"yyyy-MM-dd";
        return [self.dateFormatter stringFromDate:sourceDate];
    }
}


/// 电话号码正则
+ (NSRegularExpression *)regexPhoneNumber {
    static NSRegularExpression *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [NSRegularExpression regularExpressionWithPattern:@"\\d{3,4}[- ]?\\d{7,8}" options:kNilOptions error:NULL];
    });
    return regex;
}

/// 链接正则
+ (NSRegularExpression *)regexLinkUrl {
    static NSRegularExpression *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [NSRegularExpression regularExpressionWithPattern:@"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)" options:kNilOptions error:NULL];
    });
    return regex;
}


+ (void)hideAllPopViewWithAnimated:(BOOL)animated {
    /// 关掉更多View
    //    [MHMomentOperationMoreView hideAllOperationMoreViewWithAnimated:animated];
    /// 关闭键盘
    if(YYRSharedAppDelegate.isShowKeyboard){ [[UIApplication sharedApplication].keyWindow endEditing:YES]; }
}

@end
