//
//  YYRPreferenceSettingHelper.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRPreferenceSettingHelper.h"

/// 偏好设置
#define YYRUserDefaults [NSUserDefaults standardUserDefaults]

/// 存储language
NSString * const YYRPreferenceSettingLanguage = @"YYRPreferenceSettingLanguage";

/// 存储看一看
NSString * const YYRPreferenceSettingLook = @"YYRPreferenceSettingLook";
/// 存储看一看（全新）
NSString * const YYRPreferenceSettingLookArtboard = @"YYRPreferenceSettingLookArtboard";

/// 存储搜一搜
NSString * const YYRPreferenceSettingSearch = @"YYRPreferenceSettingSearch" ;
/// 存储搜一搜（全新）
NSString * const YYRPreferenceSettingSearchArtboard = @"YYRPreferenceSettingSearchArtboard" ;


/// ---- 新消息通知
/// 接收新消息通知
NSString * const YYRPreferenceSettingReceiveNewMessageNotification = @"YYRPreferenceSettingReceiveNewMessageNotification";
/// 接收语音和视频聊天邀请通知
NSString * const YYRPreferenceSettingReceiveVoiceOrVideoNotification = @"YYRPreferenceSettingReceiveVoiceOrVideoNotification";
/// 视频聊天、语音聊天铃声
NSString * const YYRPreferenceSettingVoiceOrVideoChatRing = @"YYRPreferenceSettingVoiceOrVideoChatRing" ;
/// 通知显示消息详情
NSString * const YYRPreferenceSettingNotificationShowDetailMessage = @"YYRPreferenceSettingNotificationShowDetailMessage" ;
/// 消息提醒铃声
NSString * const YYRPreferenceSettingMessageAlertVolume = @"YYRPreferenceSettingMessageAlertVolume";
/// 消息提醒震动
NSString * const YYRPreferenceSettingMessageAlertVibration = @"YYRPreferenceSettingMessageAlertVibration";


/// ---- 设置消息免打扰
NSString * const YYRPreferenceSettingMessageFreeInterruption = @"YYRPreferenceSettingMessageFreeInterruption" ;

/// ---- 隐私
/// 加我为朋友时需要验证
NSString * const YYRPreferenceSettingAddFriendNeedVerify = @"YYRPreferenceSettingAddFriendNeedVerify";
/// 向我推荐通讯录朋友
NSString * const YYRPreferenceSettingRecommendFriendFromContactsList = @"YYRPreferenceSettingRecommendFriendFromContactsList";
/// 允许陌生人查看十条朋友圈
NSString * const YYRPreferenceSettingAllowStrongerWatchTenMoments = @"YYRPreferenceSettingAllowStrongerWatchTenMoments";
/// 开启朋友圈入口
NSString * const YYRPreferenceSettingOpenFriendMomentsEntrance = @"YYRPreferenceSettingOpenFriendMomentsEntrance";
/// 朋友圈更新提醒
NSString * const YYRPreferenceSettingFriendMomentsUpdateAlert = @"YYRPreferenceSettingFriendMomentsUpdateAlert";

/// ---- 通用
/// 听筒模式
NSString * const YYRPreferenceSettingReceiverMode = @"YYRPreferenceSettingReceiverMode";

@implementation YYRPreferenceSettingHelper

+ (id)objectForKey:(NSString *)defaultName {
    return [YYRUserDefaults objectForKey:defaultName];
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName {
    [YYRUserDefaults setObject:value forKey:defaultName];
    [YYRUserDefaults synchronize];
}

+ (BOOL)boolForKey:(NSString *)defaultName {
    return [YYRUserDefaults boolForKey:defaultName];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName {
    [YYRUserDefaults setBool:value forKey:defaultName];
    [YYRUserDefaults synchronize];
}

@end
