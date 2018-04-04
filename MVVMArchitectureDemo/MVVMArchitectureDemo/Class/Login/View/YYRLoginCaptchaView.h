//
//  YYRLoginCaptchaView.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/4/3.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRBaseView.h"

@interface YYRLoginCaptchaView : YYRBaseView

/// init
+ (instancetype)captchaView;

/// captchaTextField
@property (weak, nonatomic) UITextField *captchaTextField;

/// 获取验证码
@property (weak, nonatomic) UIButton *captchaButton;

/// left default is 45
@property (assign, nonatomic) CGFloat captchaTextFieldLeftCons;

@end
