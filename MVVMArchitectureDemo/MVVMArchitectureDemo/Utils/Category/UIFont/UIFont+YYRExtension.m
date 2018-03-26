//
//  UIFont+YYRExtension.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

/**
 *
 (
 "PingFangSC-Ultralight",
 "PingFangSC-Regular",
 "PingFangSC-Semibold",
 "PingFangSC-Thin",
 "PingFangSC-Light",
 "PingFangSC-Medium"
 )
 */
/**
 *  极细体
 */
static NSString *const YYRPingFangSC_Ultralight = @"PingFangSC-Ultralight";
/**
 *  常规体
 */
static NSString *const YYRPingFangSC_Regular = @"PingFangSC-Regular";
/**
 *  中粗体
 */
static NSString *const YYRPingFangSC_Semibold = @"PingFangSC-Semibold";
/**
 *  纤细体
 */
static NSString *const YYRPingFangSC_Thin = @"PingFangSC-Thin";
/**
 *  细体
 */
static NSString *const YYRPingFangSC_Light = @"PingFangSC-Light";
/**
 *  中黑体
 */
static NSString *const YYRPingFangSC_Medium = @"PingFangSC-Medium";


#import "UIFont+YYRExtension.h"

@implementation UIFont (YYRExtension)

/**
 *  苹方极细体
 *
 *  @param fontSize 字体大小
 *
 */
+ (instancetype)yyr_fontForPingFangSC_UltralightFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:YYRPingFangSC_Ultralight size:fontSize];
}

/**
 *  苹方常规体
 *
 *  @param fontSize 字体大小
 *
 */
+ (instancetype)yyr_fontForPingFangSC_RegularFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:YYRPingFangSC_Regular size:fontSize];
}

/**
 *  苹方中粗体
 *
 *  @param fontSize 字体大小
 *
 */
+ (instancetype)yyr_fontForPingFangSC_SemiboldFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:YYRPingFangSC_Semibold size:fontSize];
}

/**
 *  苹方纤细体
 *
 *  @param fontSize 字体大小
 *
 */
+ (instancetype)yyr_fontForPingFangSC_ThinFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:YYRPingFangSC_Thin size:fontSize];
}

/**
 *  苹方细体
 *
 *  @param fontSize 字体大小
 *
 */
+ (instancetype)yyr_fontForPingFangSC_LightFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:YYRPingFangSC_Light size:fontSize];
}

/**
 *  苹方中黑体
 *
 *  @param fontSize 字体大小
 *
 */
+ (instancetype)yyr_fontForPingFangSC_MediumFontOfSize:(CGFloat)fontSize {
    return [UIFont fontWithName:YYRPingFangSC_Medium size:fontSize];
}


@end
