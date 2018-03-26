//
//  YYRPreferenceSettingHelper.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 存储language
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingLanguage ;

/// 存储看一看
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingLook ;
/// 存储看一看（全新）
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingLookArtboard ;
/// 存储搜一搜
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingSearch ;
/// 存储搜一搜（全新）
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingSearchArtboard ;




/// ---- 新消息通知
/// 接收新消息通知
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingReceiveNewMessageNotification ;
/// 接收语音和视频聊天邀请通知
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingReceiveVoiceOrVideoNotification ;
/// 视频聊天、语音聊天铃声
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingVoiceOrVideoChatRing ;
/// 通知显示消息详情
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingNotificationShowDetailMessage ;
/// 消息提醒铃声
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingMessageAlertVolume ;
/// 消息提醒震动
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingMessageAlertVibration ;


/// ---- 设置消息免打扰
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingMessageFreeInterruption ;


/// ---- 隐私
/// 加我为朋友时需要验证
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingAddFriendNeedVerify ;
/// 向我推荐通讯录朋友
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingRecommendFriendFromContactsList ;
/// 允许陌生人查看十条朋友圈
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingAllowStrongerWatchTenMoments ;
/// 开启朋友圈入口
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingOpenFriendMomentsEntrance ;
/// 朋友圈更新提醒
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingFriendMomentsUpdateAlert ;


/// ---- 通用
/// 听筒模式
FOUNDATION_EXTERN NSString * const YYRPreferenceSettingReceiverMode ;

@interface YYRPreferenceSettingHelper : NSObject

+ (id)objectForKey:(NSString *)defaultName;
+ (void)setObject:(id)value forKey:(NSString *)defaultName;

+ (BOOL)boolForKey:(NSString *)defaultName;
+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName;

@end
