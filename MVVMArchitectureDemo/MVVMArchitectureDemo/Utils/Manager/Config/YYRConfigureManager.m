//
//  YYRConfigureManager.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRConfigureManager.h"

///
static NSString *is_formal_setting = nil;
static NSString *is_use_https = nil;
static NSString *is_appStore_formal_setting = nil;

/// (AppStore环境的key)
static NSString * const YYRApplicationAppStoreFormalSettingKey = @"YYRApplicationAppStoreFormalSettingKey";
/// 正式环境key
static NSString * const YYRApplicationFormalSettingKey = @"YYRApplicationFormalSettingKey";
/// 使用Httpskey
static NSString * const YYRApplicationUseHttpsKey = @"YYRApplicationUseHttpsKey";

@implementation YYRConfigureManager
/// 公共配置
+ (void)configure{
    /// 初始化一些公共配置...
    
}

+ (void)setApplicationFormalSetting:(BOOL)formalSetting{
    is_formal_setting = formalSetting ? @"1" : @"0";
    [[NSUserDefaults standardUserDefaults] setObject:is_formal_setting forKey:YYRApplicationFormalSettingKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)applicationFormalSetting{
#if DEBUG
    if (!is_formal_setting) {
        is_formal_setting = [[NSUserDefaults standardUserDefaults] objectForKey:YYRApplicationFormalSettingKey];
        is_formal_setting = [is_formal_setting yyr_stringValueExtension];
    }
    return (is_formal_setting.integerValue == 1);
#else
    /// Release 模式下默认
    return YES;
#endif
}


+ (void)setApplicationAppStoreFormalSetting:(BOOL)formalSetting {
    is_appStore_formal_setting = formalSetting ? @"1" : @"0";
    [[NSUserDefaults standardUserDefaults] setObject:is_appStore_formal_setting forKey:YYRApplicationAppStoreFormalSettingKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)applicationAppStoreFormalSetting {
#if DEBUG
    if (!is_appStore_formal_setting) {
        is_appStore_formal_setting = [[NSUserDefaults standardUserDefaults] objectForKey:YYRApplicationAppStoreFormalSettingKey];
        is_appStore_formal_setting = [is_appStore_formal_setting yyr_stringValueExtension];
    }
    return (is_appStore_formal_setting.integerValue == 1);
#else
    /// Release 默认是AppStore环境
    return YES;
#endif
}

+ (void)setApplicationUseHttps:(BOOL)useHttps {
    is_use_https = useHttps ? @"1" : @"0";
    [[NSUserDefaults standardUserDefaults] setObject:is_use_https forKey:YYRApplicationUseHttpsKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)applicationUseHttps {
#if DEBUG
    if (!is_use_https) {
        is_use_https = [[NSUserDefaults standardUserDefaults] objectForKey:YYRApplicationUseHttpsKey];
        /// 正式环境
        if ([self applicationFormalSetting]) {
            /// 默认如果是nil 则加载Https
            if (is_use_https == nil) {
                is_use_https = @"1";
            }
        }
        is_use_https = [is_use_https yyr_stringValueExtension];
    }
    return (is_use_https.integerValue == 1);
#else
    /// Release 默认是AppStore环境
    return YES;
#endif
}



/// 请求的baseUrl
+ (NSString *)requestBaseUrl {
    if ([self applicationFormalSetting]){
        /// 注意：这里针对你项目中请求baseUrl来处理....
        if ([self applicationAppStoreFormalSetting]) {
            /// AppStore正式环境
            NSLog(@"￥￥￥￥￥￥￥￥ AppStore正式环境 ￥￥￥￥￥￥￥￥");
            return [self applicationUseHttps] ? @"https://live.9158.com/" : @"https://live.9158.com/";
        } else {
            /// 测试正式环境
            NSLog(@"￥￥￥￥￥￥￥￥ 测试正式环境 ￥￥￥￥￥￥￥￥");
            return [self applicationUseHttps] ? @"https://live.9158.com/" : @"https://live.9158.com/";
        }
    } else {
        /// 测试环境
        NSLog(@"￥￥￥￥￥￥￥￥ 测试环境 ￥￥￥￥￥￥￥￥");
        return [self applicationUseHttps] ? @"https://live.9158.com/" : @"https://live.9158.com/";
    }
}

@end
