//
//  YYRBootLoginViewController.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/30.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRBootLoginViewController.h"

@interface YYRBootLoginViewController ()

/// 登录按钮
@property (weak, nonatomic) UIButton *loginBtn;
/// 注册按钮
@property (weak, nonatomic) UIButton *registerBtn;
/// viewModel
@property (nonatomic, readonly, strong) YYRBootLoginViewModel *viewModel;
/// languageBtn
@property (weak, nonatomic) UIButton *languageBtn;

@end

@implementation YYRBootLoginViewController

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    /// 设置子控件
    [self _setupSubViews];
}

#pragma mark - 事件处理
- (void)_languageBtnDidClicked:(UIButton *)button {
    [self.viewModel.languageCommand execute:nil];
}

- (void)_loginBtnDidClicked:(UIButton *)button {
    [self.viewModel.loginCommand execute:nil];
}

- (void)_registerBtnDidClicked:(UIButton *)button {
    [self.viewModel.registerCommand execute:nil];
}


#pragma mark - Override
- (void)bindViewModel{
    [super bindViewModel];
    @weakify(self);
    [RACObserve(self.viewModel, language) subscribeNext:^(NSString * language) {
        @strongify(self);
        [self.languageBtn setTitle:language forState:UIControlStateNormal];
    }];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

#pragma mark - 设置子控件
- (void)_setupSubViews {
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.image = YYRImageNamed(@"BootImage_375x667");
    [self.view addSubview:bgImageView];
    
    UIButton *languageBtn = [UIButton yyr_buttonWithTitle:@"" fontSize:12 textColor:[UIColor clearColor]];
    
    [languageBtn addTarget:self action:@selector(_languageBtnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:languageBtn];
    self.languageBtn = languageBtn;
    
    UIButton *loginBtn = [UIButton yyr_buttonWithTitle:@"登录" fontSize:17 textColor:YYRColorFromHexString(@"#353535")];
    [loginBtn setBackgroundImage:[UIImage yy_imageWithColor:YYRColorFromHexString(@"#F8F8F8")] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage yy_imageWithColor:YYRColorFromHexString(@"#E3E3E3")] forState:UIControlStateHighlighted];
    [loginBtn addTarget:self action:@selector(_loginBtnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    self.loginBtn = loginBtn;
    
    UIButton *registerBtn = [UIButton yyr_buttonWithTitle:@"注册" fontSize:17 textColor:YYRColorFromHexString(@"#FFFFFF")];
    [registerBtn setBackgroundImage:[UIImage yy_imageWithColor:YYRColorFromHexString(@"#52AA35")] forState:UIControlStateNormal];
    [registerBtn setBackgroundImage:[UIImage yy_imageWithColor:YYRColorFromHexString(@"#0F961A")] forState:UIControlStateHighlighted];
    [registerBtn addTarget:self action:@selector(_registerBtnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    self.registerBtn = registerBtn;
    
    CGFloat margin = 8.0;
    [self.languageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(2.5 * margin);
        make.right.equalTo(self.view).offset(-2.5 * margin);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(2.5 * margin);
        make.bottom.equalTo(self.view).offset(-2.5 * margin);
        make.height.mas_equalTo(5.5 * margin);
        make.width.equalTo(self.registerBtn);
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-2.5 * margin);
        make.bottom.width.height.equalTo(self.loginBtn);
        make.left.equalTo(self.loginBtn.mas_right).offset(2.5 * margin);
    }];
    
}

@end
