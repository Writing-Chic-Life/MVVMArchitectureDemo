//
//  YYRLoginPasswordView.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/4/2.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRLoginPasswordView.h"

@interface YYRLoginPasswordView ()

@property (weak, nonatomic) UILabel *passwordLabel;

@property (weak, nonatomic) UIView *dividerView;

@end
@implementation YYRLoginPasswordView

+ (instancetype)passwordView {
    return [[YYRLoginPasswordView alloc] init];
}

- (void)setPasswordTitle:(NSString *)passwordTitle {
    _passwordTitle = passwordTitle;
    self.passwordLabel.text = passwordTitle;
}

- (void)setPasswordTextFieldLeftCons:(CGFloat)passwordTextFieldLeftCons {
    _passwordTextFieldLeftCons = passwordTextFieldLeftCons;
    
    [self.passwordTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordLabel.mas_right).offset(passwordTextFieldLeftCons);
    }];
}

- (void)initUI {
    [super initUI];
    
    UILabel *passwordLabel = [UILabel yyr_labelWithText:@"密码" fontSize:17 textColor:[UIColor blackColor]];
    // 设置拉伸难易度
    [passwordLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [self addSubview:passwordLabel];
    self.passwordLabel = passwordLabel;
   
    
    UITextField *passwordTextField = [[UITextField alloc] init];
    /// 限制密码位数 16
    [passwordTextField yyr_limitMaxLength:16];
    // 设置拉伸难易度
    [passwordTextField setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [self addSubview:passwordTextField];
    self.passwordTextField = passwordTextField;
    
    UIView *dividerView = [[UIView alloc] init];
    dividerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:dividerView];
    self.dividerView = dividerView;
}

- (void)initConstraint {
    [super initConstraint];
    
    CGFloat margin = 8.0;
    [self.passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.dividerView);
        make.centerY.equalTo(self);
    }];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self.passwordLabel.mas_right).offset(8 * margin);
        make.right.equalTo(self.dividerView);
        make.bottom.equalTo(self.dividerView.mas_top);
    }];
    [self.dividerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(2.5 * margin);
        make.right.equalTo(self).offset(-2.5 * margin);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
}

@end
