//
//  UIFont+YYRExtension.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

/**
 *  但是苹方字体 iOS9.0+出现  需要做适配
 *  这个分类主要用来 字体...
 (
 "PingFangSC-Ultralight",
 "PingFangSC-Regular",
 "PingFangSC-Semibold",
 "PingFangSC-Thin",
 "PingFangSC-Light",
 "PingFangSC-Medium"
 )
 */

// IOS版本
#define YYRIOSVersion ([[[UIDevice currentDevice] systemVersion] floatValue])


/// 设置系统的字体大小（YES：粗体 NO：常规）
#define YYRFont(__size__,__bold__) ((__bold__)?([UIFont boldSystemFontOfSize:__size__]):([UIFont systemFontOfSize:__size__]))

/// 极细体
#define YYRUltralightFont(__size__) ((YYRIOSVersion<9.0)?YYRFont(__size__ , YES):[UIFont yyr_fontForPingFangSC_UltralightFontOfSize:__size__])

/// 纤细体
#define YYRThinFont(__size__)       ((YYRIOSVersion<9.0)?YYRFont(__size__ , YES):[UIFont yyr_fontForPingFangSC_ThinFontOfSize:__size__])

/// 细体
#define YYRLightFont(__size__)      ((YYRIOSVersion<9.0)?YYRFont(__size__ , YES):[UIFont yyr_fontForPingFangSC_LightFontOfSize:__size__])

// 中等
#define YYRMediumFont(__size__)     ((YYRIOSVersion<9.0)?YYRFont(__size__ , YES):[UIFont yyr_fontForPingFangSC_MediumFontOfSize:__size__])

// 常规
#define YYRRegularFont(__size__)    ((YYRIOSVersion<9.0)?YYRFont(__size__ , NO):[UIFont yyr_fontForPingFangSC_RegularFontOfSize:__size__])

/** 中粗体 */
#define YYRSemiboldFont(__size__)   ((YYRIOSVersion<9.0)?YYRFont(__size__ , YES):[UIFont yyr_fontForPingFangSC_SemiboldFontOfSize:__size__])



/// 苹方常规字体 10
#define YYRRegularFont_10 YYRRegularFont(10.0f)
/// 苹方常规字体 11
#define YYRRegularFont_11 YYRRegularFont(11.0f)
/// 苹方常规字体 12
#define YYRRegularFont_12 YYRRegularFont(12.0f)
/// 苹方常规字体 13
#define YYRRegularFont_13 YYRRegularFont(13.0f)
/** 苹方常规字体 14 */
#define YYRRegularFont_14 YYRRegularFont(14.0f)
/// 苹方常规字体 15
#define YYRRegularFont_15 YYRRegularFont(15.0f)
/// 苹方常规字体 16
#define YYRRegularFont_16 YYRRegularFont(16.0f)
/// 苹方常规字体 17
#define YYRRegularFont_17 YYRRegularFont(17.0f)
/// 苹方常规字体 18
#define YYRRegularFont_18 YYRRegularFont(18.0f)
/// 苹方常规字体 19
#define YYRRegularFont_19 YYRRegularFont(19.0f)
/// 苹方常规字体 20
#define YYRRegularFont_20 YYRRegularFont(20.0f)

#import <UIKit/UIKit.h>

@interface UIFont (YYRExtension)

/**
 *  苹方极细体
 *
 *  @param fontSize 字体大小
 *
 */
+ (instancetype)yyr_fontForPingFangSC_UltralightFontOfSize:(CGFloat)fontSize;

/**
 *  苹方常规体
 *
 *  @param fontSize 字体大小
 *
 */
+ (instancetype)yyr_fontForPingFangSC_RegularFontOfSize:(CGFloat)fontSize;

/**
 *  苹方中粗体
 *
 *  @param fontSize 字体大小
 *
 */
+ (instancetype)yyr_fontForPingFangSC_SemiboldFontOfSize:(CGFloat)fontSize;

/**
 *  苹方纤细体
 *
 *  @param fontSize 字体大小
 *
 */
+ (instancetype)yyr_fontForPingFangSC_ThinFontOfSize:(CGFloat)fontSize;

/**
 *  苹方细体
 *
 *  @param fontSize 字体大小
 *
 */
+ (instancetype)yyr_fontForPingFangSC_LightFontOfSize:(CGFloat)fontSize;

/**
 *  苹方中黑体
 *
 *  @param fontSize 字体大小
 *
 */
+ (instancetype)yyr_fontForPingFangSC_MediumFontOfSize:(CGFloat)fontSize;


@end
