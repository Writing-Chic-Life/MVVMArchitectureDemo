//
//  YYRRouter.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRRouter.h"

@interface YYRRouter ()

/// viewModel到viewController的映射
@property (nonatomic, copy) NSDictionary *viewModelViewMappings;

@end

@implementation YYRRouter

static YYRRouter *sharedInstance_ = nil;

+ (id)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [super allocWithZone:zone];
    });
    return sharedInstance_;
}

- (id)copyWithZone:(NSZone *)zone {
    return sharedInstance_;
}

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (YYRViewController *)viewControllerForViewModel:(YYRViewModel *)viewModel {
    NSString *viewController = self.viewModelViewMappings[NSStringFromClass(viewModel.class)];
    
    NSParameterAssert([NSClassFromString(viewController) isSubclassOfClass:[YYRViewController class]]);
    NSParameterAssert([NSClassFromString(viewController) instancesRespondToSelector:@selector(initWithViewModel:)]);
    
    return [[NSClassFromString(viewController) alloc] initWithViewModel:viewModel];
}


/// 这里是viewModel -> ViewController的映射
/// If You Use Push 、 Present 、 ResetRootViewController ,You Must Config This Dict
- (NSDictionary *)viewModelViewMappings {
    return @{@"YYRNewFeatureViewModel":@"YYRNewFeatureViewController",
             @"YYRMainTabBarViewModel":@"YYRMainTabBarController",
             @"YYRUserInfoViewModel":@"YYRUserInfoViewController",
             @"YYRMoreInfoViewModel":@"YYRMoreInfoViewController",
             @"YYRFeatureSignatureViewModel":@"YYRFeatureSignatureViewController",
             @"YYRAddFriendsViewModel":@"YYRAddFriendsViewController",
             @"YYRSearchFriendsViewModel":@"YYRSearchFriendsViewController",
             @"YYRAccountLoginViewModel":@"YYRAccountLoginViewController",
             @"YYRBootLoginViewModel":@"YYRBootLoginViewController",
             @"YYRLoginViewModel":@"YYRLoginViewController",
             @"YYRMobileLoginViewModel":@"YYRMobileLoginViewController",
             @"YYRZoneCodeViewModel":@"YYRZoneCodeViewController",
             @"YYRSettingViewModel":@"YYRSettingViewController",
             @"YYRWebViewModel":@"YYRWebViewController",
             @"YYRRegisterViewModel":@"YYRRegisterViewController",
             @"YYRCommitViewModel":@"YYRCommitViewController",
             @"YYRLanguageViewModel":@"YYRLanguageViewController",
             @"YYRModifyNicknameViewModel":@"YYRModifyNicknameViewController",
             @"YYRLocationViewModel":@"YYRLocationViewController",
             @"YYRGenderViewModel":@"YYRGenderViewController",
             @"YYRPlugViewModel":@"YYRPlugViewController",
             @"YYRPlugDetailViewModel":@"YYRPlugDetailViewController",
             @"YYRAccountSecurityViewModel":@"YYRAccountSecurityViewController",
             @"YYRTestViewModel":@"YYRTestViewController",
             @"YYRNotificationViewModel":@"YYRNotificationViewController",
             @"YYRFreeInterruptionViewModel":@"YYRFreeInterruptionViewController",
             @"YYRAboutUsViewModel":@"YYRAboutUsViewController",
             @"YYRPrivacyViewModel":@"YYRPrivacyViewController",
             @"YYRGeneralViewModel":@"YYRGeneralViewController",
             @"YYREmotionViewModel":@"YYREmotionViewController",
             @"YYRMomentViewModel":@"YYRMomentViewController",
             @"YYRProfileInfoViewModel":@"YYRProfileInfoViewController"
             };
}

@end
