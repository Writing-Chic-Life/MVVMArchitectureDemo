//
//  YYRLoginCaptchaView.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/4/3.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRLoginCaptchaView.h"

@interface YYRLoginCaptchaView ()

@property (weak, nonatomic) UILabel *captchaLabel;

@property (weak, nonatomic) UIView *dividerView;

@end
@implementation YYRLoginCaptchaView

+ (instancetype)captchaView {
    return [[YYRLoginCaptchaView alloc] init];
}

- (void)setCaptchaTextFieldLeftCons:(CGFloat)captchaTextFieldLeftCons {
    _captchaTextFieldLeftCons = captchaTextFieldLeftCons;
    
    [self.captchaTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.captchaLabel.mas_right).offset(captchaTextFieldLeftCons);
    }];
}

- (void)initUI {
    [super initUI];
    
    UILabel *captchaLabel = [UILabel yyr_labelWithText:@"密码" fontSize:17 textColor:[UIColor blackColor]];
    [self addSubview:captchaLabel];
    self.captchaLabel = captchaLabel;
    
    
    UITextField *captchaTextField = [[UITextField alloc] init];
    /// 限制验证码位数 6
    [captchaTextField yyr_limitMaxLength:6];
    [self addSubview:captchaTextField];
    self.captchaTextField = captchaTextField;

    UIButton *captchaButton = [UIButton yyr_buttonWithTitle:@"获取验证码" fontSize:13 textColor:YYRColorFromHexString(@"#353535")];
    captchaButton.borderWidth = 1;
    captchaButton.cornerRadius = 4;
    captchaButton.borderColor = YYRColorFromHexString(@"#353535");
    [self addSubview:captchaButton];
    self.captchaButton = captchaButton;
    
    UIView *dividerView = [[UIView alloc] init];
    dividerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:dividerView];
    self.dividerView = dividerView;
    
    /// 监听获取按钮的enable属性
    @weakify(self)
    [[RACObserve(self.captchaButton, enabled) skip:1] subscribeNext:^(NSNumber *enabled) {
        @strongify(self)
        self.captchaButton.layer.borderColor = enabled.boolValue ? YYRColorFromHexString(@"#353535").CGColor : YYRColorFromHexString(@"#C8C8C8").CGColor;
    }];
}

- (void)initConstraint {
    [super initConstraint];
    
    CGFloat margin = 8.0;
    [self.captchaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.dividerView);
        make.centerY.equalTo(self);
    }];
    [self.captchaTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self.captchaLabel.mas_right).offset(5.5 * margin);
        make.right.equalTo(self.captchaButton.mas_left).offset(-4 * margin);
        make.bottom.equalTo(self.dividerView.mas_top);
    }];
    
    [self.captchaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.captchaLabel.mas_right).offset(8 * margin);
        make.right.equalTo(self.dividerView);
        make.bottom.equalTo(self.dividerView.mas_top);
        make.height.mas_equalTo(3 * margin);
    }];
    [self.dividerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(2.5 * margin);
        make.right.equalTo(self).offset(-2.5 * margin);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
}

@end
