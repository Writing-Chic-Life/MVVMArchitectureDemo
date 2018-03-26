//
//  NSError+YYRExtension.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (YYRExtension)

+ (NSString *)yyr_tipsFromError:(NSError *)error;

@end
