//
//  NSDateFormatter+YYRExtension.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (YYRExtension)

+ (instancetype)yyr_dateFormatter;

+ (instancetype)yyr_dateFormatterWithFormat:(NSString *)dateFormat;

+ (instancetype)yyr_defaultDateFormatter;/*yyyy/MM/dd HH:mm:ss*/

@end
