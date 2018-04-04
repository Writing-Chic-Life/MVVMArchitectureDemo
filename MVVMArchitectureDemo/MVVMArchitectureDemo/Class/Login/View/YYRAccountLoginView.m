//
//  YYRAccountLoginView.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/4/3.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRAccountLoginView.h"
#import "YYRLoginPasswordView.h"

@interface YYRAccountLoginView ()

@property (weak, nonatomic) UILabel *titleLabel;

@property (weak, nonatomic) YYRLoginPasswordView *accountView;
@property (weak, nonatomic) YYRLoginPasswordView *passwordView;

@end
@implementation YYRAccountLoginView

+ (instancetype)accoutLoginView {
    return [[YYRAccountLoginView alloc] init];
}


- (void)initUI {
    [super initUI];
    
    UILabel *titleLabel = [UILabel yyr_labelWithText:@"微信号/QQ号/邮箱登录" fontSize:17 textColor:[UIColor blackColor]];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    YYRLoginPasswordView *accountView = [YYRLoginPasswordView passwordView];
    accountView.passwordTitle = @"账号";
    [self addSubview:accountView];
    self.accountView = accountView;
    self.accountTextField = accountView.passwordTextField;
    self.accountTextField.placeholder = @"微信号/QQ号/邮箱登录";
    /// 限制QQ位数 11
    [self.accountTextField yyr_limitMaxLength:11];
    
    YYRLoginPasswordView *passwordView = [YYRLoginPasswordView passwordView];
    [self addSubview:passwordView];
    self.passwordView = passwordView;
    self.passwordTextField = passwordView.passwordTextField;
    self.passwordTextField.placeholder = @"请填写密码";
    /// 限制密码位数 16
    [self.passwordTextField yyr_limitMaxLength:16];
}

- (void)initConstraint {
    [super initConstraint];
    
    CGFloat margin = 8.0;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(2.5 * margin);
        make.top.equalTo(self);
    }];
    
    [self.accountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(5.5 * margin);
    }];
    
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountView.mas_bottom);
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(5.5 * margin);
    }];
}


@end
