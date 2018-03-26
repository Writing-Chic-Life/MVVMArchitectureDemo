//
//  SAMKeychain+YYRUtil.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <SAMKeychain/SAMKeychain.h>

@interface SAMKeychain (YYRUtil)

+ (NSString *)rawLogin;

+ (BOOL)setRawLogin:(NSString *)rawLogin;

+ (BOOL)deleteRawLogin;


/// 设备ID or UUID
+ (NSString *)deviceId;

@end
