//
//  NSDateFormatter+YYRExtension.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "NSDateFormatter+YYRExtension.h"

@implementation NSDateFormatter (YYRExtension)

+ (instancetype)yyr_dateFormatter {
    return [[self alloc] init];
}

+ (instancetype)yyr_dateFormatterWithFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[self alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

+ (instancetype)yyr_defaultDateFormatter {
    return [self yyr_dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

@end
