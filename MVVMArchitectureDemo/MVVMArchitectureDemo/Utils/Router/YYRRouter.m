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
    return @{@"MHNewFeatureViewModel":@"MHNewFeatureViewController",
             @"MHHomePageViewModel":@"MHHomePageViewController",
             @"MHUserInfoViewModel":@"MHUserInfoViewController",
             @"MHMoreInfoViewModel":@"MHMoreInfoViewController",
             @"MHFeatureSignatureViewModel":@"MHFeatureSignatureViewController",
             @"MHAddFriendsViewModel":@"MHAddFriendsViewController",
             @"MHSearchFriendsViewModel":@"MHSearchFriendsViewController",
             @"MHAccountLoginViewModel":@"MHAccountLoginViewController",
             @"MHBootLoginViewModel":@"MHBootLoginViewController",
             @"MHLoginViewModel":@"MHLoginViewController",
             @"MHMobileLoginViewModel":@"MHMobileLoginViewController",
             @"MHZoneCodeViewModel":@"MHZoneCodeViewController",
             @"MHSettingViewModel":@"MHSettingViewController",
             @"MHWebViewModel":@"MHWebViewController",
             @"MHRegisterViewModel":@"MHRegisterViewController",
             @"MHCommitViewModel":@"MHCommitViewController",
             @"MHLanguageViewModel":@"MHLanguageViewController",
             @"MHModifyNicknameViewModel":@"MHModifyNicknameViewController",
             @"MHLocationViewModel":@"MHLocationViewController",
             @"MHGenderViewModel":@"MHGenderViewController",
             @"MHPlugViewModel":@"MHPlugViewController",
             @"MHPlugDetailViewModel":@"MHPlugDetailViewController",
             @"MHAccountSecurityViewModel":@"MHAccountSecurityViewController",
             @"MHTestViewModel":@"MHTestViewController",
             @"MHNotificationViewModel":@"MHNotificationViewController",
             @"MHFreeInterruptionViewModel":@"MHFreeInterruptionViewController",
             @"MHAboutUsViewModel":@"MHAboutUsViewController",
             @"MHPrivacyViewModel":@"MHPrivacyViewController",
             @"MHGeneralViewModel":@"MHGeneralViewController",
             @"MHEmotionViewModel":@"MHEmotionViewController",
             @"MHMomentViewModel":@"MHMomentViewController",
             @"MHProfileInfoViewModel":@"MHProfileInfoViewController"
             };
}

@end
