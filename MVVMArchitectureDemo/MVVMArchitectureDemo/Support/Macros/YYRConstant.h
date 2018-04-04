//
//  YYRConstant.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/// Block
///------
typedef void (^VoidBlock)(void);
typedef BOOL (^BoolBlock)(void);
typedef int  (^IntBlock) (void);
typedef id   (^IDBlock)  (void);

typedef void (^VoidBlock_int)(int);
typedef BOOL (^BoolBlock_int)(int);
typedef int  (^IntBlock_int) (int);
typedef id   (^IDBlock_int)  (int);

typedef void (^VoidBlock_string)(NSString *);
typedef BOOL (^BoolBlock_string)(NSString *);
typedef int  (^IntBlock_string) (NSString *);
typedef id   (^IDBlock_string)  (NSString *);

typedef void (^VoidBlock_id)(id);
typedef BOOL (^BoolBlock_id)(id);
typedef int  (^IntBlock_id) (id);
typedef id   (^IDBlock_id)  (id);


#pragma mark - 应用相关的
/// 切换根控制器的通知 新特性
FOUNDATION_EXTERN NSString * const YYRSwitchRootViewControllerNotification;
/// 切换根控制器的通知 UserInfo key
FOUNDATION_EXTERN NSString * const YYRSwitchRootViewControllerUserInfoKey;

/// 插件Switch按钮值改变
FOUNDATION_EXTERN NSString * const YYRPlugSwitchValueDidChangedNotification;




/// 全局分割线高度 .5
FOUNDATION_EXTERN CGFloat const YYRGlobalBottomLineHeight;

/// 个性签名的最大字数为30
FOUNDATION_EXTERN NSUInteger const YYRFeatureSignatureMaxWords;

/// 用户昵称的最大字数为20
FOUNDATION_EXTERN NSUInteger const YYRNicknameMaxWords;

/// 简书首页地址
FOUNDATION_EXTERN NSString * const YYRMyBlogHomepageUrl ;

/// 国家区号
FOUNDATION_EXTERN NSString * const YYRMobileLoginZoneCodeKey ;
/// 手机号码
FOUNDATION_EXTERN NSString * const YYRMobileLoginPhoneKey ;

/// 验证码时间
FOUNDATION_EXTERN NSUInteger const YYRCaptchaFetchMaxWords;






/// 朋友圈
/// 类型
typedef NS_ENUM(NSUInteger, YYRMomentContentType) {
    YYRMomentContentTypeAttitude = 0,   /// 点赞
    YYRMomentContentTypeComment ,       /// 评论
};

typedef NS_ENUM(NSUInteger, YYRDefaultAvatarType) {
    YYRDefaultAvatarTypeSmall = 0,  /// 小图 34x34
    YYRDefaultAvatarTypeDefualt,    /// 默认 50x50
    YYRDefaultAvatarTypeBig,        /// 大图 85x85
};
/// 占位头像
static inline UIImage *YYRDefaultAvatar(YYRDefaultAvatarType type)
{
    switch (type) {
        case YYRDefaultAvatarTypeSmall:
            return [UIImage imageNamed:@"wx_avatar_default_small"];
            break;
        case YYRDefaultAvatarTypeBig:
            return [UIImage imageNamed:@"wx_avatar_default_big"];
            break;
        default:
            return [UIImage imageNamed:@"wx_avatar_default"];
            break;
    }
}

/// 配图的占位图片
static inline UIImage *YYRPicturePlaceholder() {
    return [UIImage imageNamed:@"wx_timeline_image_placeholder"];
}







/// 全局细下滑线颜色 以及分割线颜色
#define WXGlobalBottomLineColor     [UIColor colorFroYYRexString:@"#D9D8D9"]
/// 全局黑色字体
#define WXGlobalBlackTextColor      [UIColor colorFroYYRexString:@"#000000"]
/// 全局灰色背景
#define WXGlobalGrayBackgroundColor [UIColor colorFroYYRexString:@"#EFEFF4"]
/// 全局分割线高度
FOUNDATION_EXTERN CGFloat const WXGlobalBottomLineHeight;



/// 微信朋友圈常量定义区
/// 头像宽高 15
FOUNDATION_EXTERN CGFloat const YYRMomentProfileViewAvatarViewWH;
/// 消息tips宽高 40
FOUNDATION_EXTERN CGFloat const YYRMomentProfileViewTipsViewHeight ;
/// 消息tips宽高 181
FOUNDATION_EXTERN CGFloat const YYRMomentProfileViewTipsViewWidth ;
/// 消息tipsView内部的头像宽高 30
FOUNDATION_EXTERN CGFloat const YYRMomentProfileViewTipsViewAvatarWH ;
/// 消息tipsView内部的头像距离tipsView边距 5
FOUNDATION_EXTERN CGFloat const YYRMomentProfileViewTipsViewInnerInset ;
/// 消息tipsView内部的右箭头距离tipsView边距 11
FOUNDATION_EXTERN CGFloat const YYRMomentProfileViewTipsViewRightInset ;
/// 消息tipsView内部的右箭头宽高 15
FOUNDATION_EXTERN CGFloat const YYRMomentProfileViewTipsViewRightArrowWH ;


//// 朋友圈说说
/// 说说内容距离顶部的间距 16
FOUNDATION_EXTERN CGFloat const YYRMomentContentTopInset;
/// 说说内容距离左右屏幕的间距 20
FOUNDATION_EXTERN CGFloat const YYRMomentContentLeftOrRightInset;
/// 内容（控件）之间的的间距 10
FOUNDATION_EXTERN CGFloat const YYRMomentContentInnerMargin;
/// 用户头像的大小 44x44
FOUNDATION_EXTERN CGFloat const YYRMomentAvatarWH;

/// 向上箭头W
FOUNDATION_EXTERN CGFloat const YYRMomentUpArrowViewWidth ;
/// 向上箭头H
FOUNDATION_EXTERN CGFloat const YYRMomentUpArrowViewHeight ;

/// 全文、收起W
FOUNDATION_EXTERN CGFloat const YYRMomentExpandButtonWidth ;
/// 全文、收起H
FOUNDATION_EXTERN CGFloat const YYRMomentExpandButtonHeight ;

/// pictureView中图片之间的的间距 6
FOUNDATION_EXTERN CGFloat const YYRMomentPhotosViewItemInnerMargin;
/// pictureView中图片的大小 86x86 (屏幕尺寸>320)
FOUNDATION_EXTERN CGFloat const YYRMomentPhotosViewItemWH1;
/// pictureView中图片的大小 70x70 (屏幕尺寸<=320)
FOUNDATION_EXTERN CGFloat const YYRMomentPhotosViewItemWH2;

/// 分享内容高度
FOUNDATION_EXTERN CGFloat const YYRMomentShareInfoViewHeight;

/// videoView高度
FOUNDATION_EXTERN CGFloat const YYRMomentVideoViewHeight ;
/// videoView宽度
FOUNDATION_EXTERN CGFloat const YYRMomentVideoViewWidth ;


/// 微信正文内容的显示最大行数（PS：如果超过最大值，那么正文内容就单行显示，可以点击正文内容查看全部内容）
FOUNDATION_EXTERN NSUInteger const YYRMomentContentTextMaxCriticalRow ;
/// 微信正文内容显示（全文/收起）的临界行
FOUNDATION_EXTERN NSUInteger const YYRMomentContentTextExpandCriticalRow ;

/// pictureView最多显示的图片数
FOUNDATION_EXTERN NSUInteger const YYRMomentPhotosMaxCount ;
/// pictureView显示图片的最大列数
#define YYRMomentMaxCols(__photosCount) ((__photosCount==4)?2:3)


/// 微信昵称字体大小
#define YYRMomentScreenNameFont YYRMediumFont(16.0f)
/// 微信正文字体大小
#define YYRMomentContentFont YYRRegularFont_15
/// 微信地址+时间+来源的字体大小
#define YYRMomentCreatedAtFont YYRRegularFont_12
/// 微信（全文/收起）字体大小
#define YYRMomentExpandTextFont YYRRegularFont_16

/// 微信评论正文字体大小
#define YYRMomentCommentContentFont YYRRegularFont_14
/// 微信评论的昵称的字体大小
#define YYRMomentCommentScreenNameFont  YYRMediumFont(14.0f)




/// 微信昵称字体颜色
#define YYRMomentScreenNameTextColor [UIColor colorFroYYRexString:@"#5B6A92"]
/// 微信正文（链接、电话）的颜色
#define YYRMomentContentUrlTextColor [UIColor colorFroYYRexString:@"#4380D1"]
/// 微信正文字体颜色
#define YYRMomentContentTextColor WXGlobalBlackTextColor
/// 微信时间颜色
#define YYRMomentCreatedAtTextColor [UIColor colorFroYYRexString:@"#737373"]



/// 点击文字高亮的颜色
#define YYRMomentTextHighlightBackgroundColor [UIColor colorFroYYRexString:@"#C7C7C7"]



/// 单张图片的最大高度（等比例）180 (ps：别问我为什么，我量出来的)
FOUNDATION_EXTERN CGFloat const YYRMomentPhotosViewSingleItemMaxHeight;


/// 更多按钮宽高 (实际：25x25)
FOUNDATION_EXTERN CGFloat const YYRMomentOperationMoreBtnWH ;


/// footerViewHeight
FOUNDATION_EXTERN CGFloat const YYRMomentFooterViewHeight ;




//// 评论和点赞view 常量
/// 评论内容距离顶部的间距 5
FOUNDATION_EXTERN CGFloat const YYRMomentCommentViewContentTopOrBottomInset;
/// 评论内容距离评论View左右屏幕的间距 9
FOUNDATION_EXTERN CGFloat const YYRMomentCommentViewContentLeftOrRightInset;
/// 点赞内容距离顶部的间距 7
FOUNDATION_EXTERN CGFloat const YYRMomentCommentViewAttitudesTopOrBottomInset;

/// 评论or点赞 view的背景色
#define YYRMomentCommentViewBackgroundColor [UIColor colorFroYYRexString:@"#F3F3F5"]
/// 评论or点赞 view的选中的背景色
#define YYRMomentCommentViewSelectedBackgroundColor [UIColor colorFroYYRexString:@"#CED2DE"]


/// 更多操作View的Size 181x39
/// 更多操作View的Size 181x39
FOUNDATION_EXTERN CGFloat const YYRMomentOperationMoreViewWidth ;
FOUNDATION_EXTERN CGFloat const YYRMomentOperationMoreViewHeight ;

/// 微信动画时间 .25f
FOUNDATION_EXTERN NSTimeInterval const YYRMommentAnimatedDuration;


/**
 YYTextHighlight *highlight = [YYTextHighlight new];
 highlight.userInfo = @{kWBLinkHrefName : href};
 */
//// 这里是点击文本链接（or其他）跳转，通过该key从userInfo中取出对应的数据
/// 点击链接
FOUNDATION_EXTERN NSString * const YYRMomentLinkUrlKey ;
/// 电话号码key
FOUNDATION_EXTERN NSString * const YYRMomentPhoneNumberKey ;
/// 点击位置
FOUNDATION_EXTERN NSString * const YYRMomentLocationNameKey;
/// 点击用户昵称
FOUNDATION_EXTERN NSString * const YYRMomentUserInfoKey;


/// 评论View
/** 弹出评论框View最小高度 */
FOUNDATION_EXTERN CGFloat const YYRMomentCommentToolViewMinHeight;
/** 弹出评论框View最大高度 */
FOUNDATION_EXTERN CGFloat const YYRMomentCommentToolViewMaxHeight ;
/** 弹出评论框View的除了编辑框的高度 */
FOUNDATION_EXTERN CGFloat const YYRMomentCommentToolViewWithNoTextViewHeight;



//// ---------------- inline ----------------

/// 图片的宽度 （九宫格）
static inline CGFloat YYRMomentPhotosViewItemWidth(){
    CGFloat itemW = ([UIScreen mainScreen].bounds.size.width<=320)? YYRMomentPhotosViewItemWH2:YYRMomentPhotosViewItemWH1;
    return itemW;
}


/// 单张图片的最大宽度（方形or等比例）
static inline CGFloat YYRMomentPhotosViewSingleItemMaxWidth(){
    CGFloat itemW = YYRMomentPhotosViewItemWidth();
    return YYRMomentPhotosViewItemInnerMargin + itemW*2;
}

/// 计算微信说说正文的limitWidth或者评论View的宽度
static inline CGFloat YYRMomentCommentViewWidth() {
    return ([UIScreen mainScreen].bounds.size.width - YYRMomentContentLeftOrRightInset*2 -YYRMomentAvatarWH - YYRMomentContentInnerMargin);
}


