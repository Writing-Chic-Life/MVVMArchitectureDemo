//
//  NSDate+YYRExtension.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDateFormatter+YYRExtension.h"

#define YYR_D_MINUTE        60
#define YYR_D_HOUR        3600
#define YYR_D_DAY        86400
#define YYR_D_WEEK        604800
#define YYR_D_YEAR        31556926

@interface NSDate (YYRExtension)

/**
 *  是否为今天
 */
- (BOOL)yyr_isToday;
/**
 *  是否为昨天
 */
- (BOOL)yyr_isYesterday;
/**
 *  是否为今年
 */
- (BOOL)yyr_isThisYear;
/**
 *  是否本周
 */
- (BOOL)yyr_isThisWeek;

/**
 *  星期几
 */
- (NSString *)yyr_weekDay;

/**
 *  是否为在相同的周
 */
- (BOOL)yyr_isSameWeekWithAnotherDate: (NSDate *)anotherDate;


/**
 *  通过一个时间 固定的时间字符串 "2016/8/10 14:43:45" 返回时间
 *  @param timestamp 固定的时间字符串 "2016/8/10 14:43:45"
 */
+ (instancetype)yyr_dateWithTimestamp:(NSString *)timestamp;

/**
 *  返回固定的 当前时间 2016-8-10 14:43:45
 */
+ (NSString *)yyr_currentTimestamp;

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)yyr_dateWithYMD;

/**
 * 格式化日期描述
 */
- (NSString *)yyr_formattedDateDescription;

/** 与当前时间的差距 */
- (NSDateComponents *)yyr_deltaWithNow;



//////////// MVC&MVVM的商品的发布时间的描述 ////////////
- (NSString *)yyr_string_yyyy_MM_dd;
- (NSString *)yyr_string_yyyy_MM_dd:(NSDate *)toDate;
//////////// MVC&MVVM的商品的发布时间的描述 ////////////

@end
