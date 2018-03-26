//
//  SAMKeychain+YYRUtil.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "SAMKeychain+YYRUtil.h"

/// 登录账号的key
static NSString *const MH_RAW_LOGIN = @"MHRawLogin";
static NSString *const MH_SERVICE_NAME_IN_KEYCHAIN = @"com.CoderMikeHe.WeChat";
static NSString *const MH_DEVICEID_ACCOUNT         = @"DeviceID";


@implementation SAMKeychain (YYRUtil)

+ (NSString *)rawLogin {
    return [[NSUserDefaults standardUserDefaults] objectForKey:MH_RAW_LOGIN];
}
+ (BOOL)setRawLogin:(NSString *)rawLogin {
    if (rawLogin == nil) NSLog(@"+setRawLogin: %@", rawLogin);
    
    [[NSUserDefaults standardUserDefaults] setObject:rawLogin forKey:MH_RAW_LOGIN];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return YES;
}
+ (BOOL)deleteRawLogin {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:MH_RAW_LOGIN];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}


+ (NSString *)deviceId {
    NSString * deviceidStr = [SAMKeychain passwordForService:MH_SERVICE_NAME_IN_KEYCHAIN account:MH_DEVICEID_ACCOUNT];
    if (deviceidStr == nil) {
        deviceidStr = [UIDevice currentDevice].identifierForVendor.UUIDString;
        [SAMKeychain setPassword:deviceidStr forService:MH_SERVICE_NAME_IN_KEYCHAIN account:MH_DEVICEID_ACCOUNT];
    }
    return deviceidStr;
}

@end
