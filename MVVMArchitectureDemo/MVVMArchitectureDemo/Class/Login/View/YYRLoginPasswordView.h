//
//  YYRLoginPasswordView.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/4/2.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRBaseView.h"

@interface YYRLoginPasswordView : YYRBaseView

/// init
+ (instancetype)passwordView;

@property (copy, nonatomic) NSString *passwordTitle;

/// passwordTextField
@property (weak, nonatomic) UITextField *passwordTextField;

/// left default is 65
@property (assign, nonatomic) CGFloat passwordTextFieldLeftCons;

@end
