//
//  YYRConstEnum.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//  所有枚举定义区域

#ifndef YYRConstEnum_h
#define YYRConstEnum_h

/// tababr item tag
typedef NS_ENUM(NSUInteger, YYRTabBarItemTagType) {
    YYRTabBarItemTagTypeMainFrame = 0,    /// 消息回话
    YYRTabBarItemTagTypeContacts,         /// 通讯录
    YYRTabBarItemTagTypeDiscover,         /// 发现
    YYRTabBarItemTagTypeProfile,          /// 我的
};


/// 切换根控制器类型
typedef NS_ENUM(NSUInteger, YYRSwitchRootViewControllerFromType) {
    YYRSwitchRootViewControllerFromTypeNewFeature = 0,  /// 新特性
    YYRSwitchRootViewControllerFromTypeLogin,           /// 登录
    YYRSwitchRootViewControllerFromTypeLogout,          /// 登出
};

/// 用户登录的渠道
typedef NS_ENUM(NSUInteger, YYRUserLoginChannelType) {
    YYRUserLoginChannelTypeQQ = 0,           /// qq登录
    YYRUserLoginChannelTypeEmail,            /// 邮箱登录
    YYRUserLoginChannelTypeWeChatId,         /// 微信号登录
    YYRUserLoginChannelTypePhone,            /// 手机号登录
};

/// 用户性别
typedef NS_ENUM(NSUInteger, YYRUserGenderType) {
    YYRUserGenderTypeMale =0,            /// 男
    YYRUserGenderTypeFemale,             /// nv
};

/// 插件详情说明
typedef NS_ENUM(NSUInteger, YYRPlugDetailType) {
    YYRPlugDetailTypeLook = 0,     /// 看一看
    YYRPlugDetailTypeSearch,       /// 搜一搜
};


/// 微信朋友圈类型 （0 配图  1 video 2 share）
typedef NS_ENUM(NSUInteger, YYRMomentExtendType) {
    YYRMomentExtendTypePicture = 0, /// 配图
    YYRMomentExtendTypeVideo,       /// 视频
    YYRMomentExtendTypeShare,       /// 分享
};


/// 微信朋友圈分享内容的类型
typedef NS_ENUM(NSUInteger, YYRMomentShareInfoType) {
    YYRMomentShareInfoTypeWebPage = 0, /// 网页
    YYRMomentShareInfoTypeMusic,       /// 音乐
};


#endif /* YYRConstEnum_h */
