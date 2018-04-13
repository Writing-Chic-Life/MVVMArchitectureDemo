//
//  YYRLoginViewController.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/4/2.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRLoginViewController.h"
#import "YYRMobileLoginView.h"
#import "YYRAccountLoginView.h"
//#import "YYRMobileLoginViewModel.h"

@interface YYRLoginViewController ()

/// viewModel
@property (nonatomic, readonly, strong) YYRLoginViewModel *viewModel;
/// 切换登录方式
@property (weak, nonatomic) UIButton *changeloginButton;
/// containerView
@property (strong, nonatomic) UIView *containerView;
/// accountBaseView
@property (weak, nonatomic) UIView *accountBaseView;
/// loginButton
@property (weak, nonatomic) UIButton *loginButton;
/// accountLoginView
@property (nonatomic, readwrite, weak) YYRAccountLoginView *accountLoginView;
/// mobileLoginView
@property (nonatomic, readwrite, weak) YYRMobileLoginView *mobileLoginView;

@end

@implementation YYRLoginViewController

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    /// 设置
    [self _setup];
    
    /// 设置导航栏
    [self _setupNavigationItem];
    
    /// 设置子控件
    [self _setupSubViews];
}

#pragma mark - Override
- (void)bindViewModel {
    [super bindViewModel];
    
    @weakify(self);
    [[RACObserve(self.changeloginButton, selected) map:^id _Nullable(NSNumber *selected) {
        return selected.boolValue ? @"登录" : @"下一步";
    }] subscribeNext:^(NSString *title) {
        @strongify(self);
        [self.loginButton setTitle:title forState:UIControlStateNormal];
    }];
    
    /// QQ/微信号/邮箱
    RAC(self.viewModel, account) = [RACSignal merge:@[RACObserve(self.accountLoginView.accountTextField, text), self.accountLoginView.accountTextField.rac_textSignal]];
    RAC(self.viewModel, password) = [RACSignal merge:@[RACObserve(self.accountLoginView.passwordTextField, text), self.accountLoginView.passwordTextField.rac_textSignal]];
    
    /// 手机号
    RAC(self.viewModel, phone) = [RACSignal merge:@[RACObserve(self.mobileLoginView.phoneTextField, text), self.mobileLoginView.phoneTextField.rac_textSignal]];
    RAC(self.viewModel, zoneCode) = [RACSignal merge:@[RACObserve(self.mobileLoginView.zoneCodeTextField, text), self.mobileLoginView.zoneCodeTextField.rac_textSignal]];
//    RAC(self.viewModel, zoneName) = [RACSignal merge:@[RACObserve(self.mobileLoginView, zoneName)]];
    
    /// 登录按钮有效性
    RAC(self.loginButton, enabled) = self.viewModel.validLoginSignal;
    
    /// show HUD
    [[[self.viewModel.loginCommand.executing
       skip:1]
      doNext:^(NSNumber * _Nullable x) {
          @strongify(self);
          [self.view endEditing:YES];
    }]
     subscribeNext:^(NSNumber * _Nullable showHud) {
         @strongify(self);
         if (showHud.boolValue) {
             [MBProgressHUD yyr_showProgressHUD:@"请稍后..."];
         } else if (!self.viewModel.error) {
             [MBProgressHUD yyr_hideHUD];
         }
    }];
}

#pragma mark - Action
- (void)_moreItemDidClicked{
    @weakify(self);
    LCActionSheet *sheet = [LCActionSheet sheetWithTitle:nil cancelButtonTitle:@"取消" clicked:^(LCActionSheet * _Nonnull actionSheet, NSInteger buttonIndex) {
        if (buttonIndex == 0) return ;
        @strongify(self);
        [self.viewModel.moreCommand execute:@(buttonIndex)];
    } otherButtonTitles:@"找回密码",@"前往微信安全中心", nil];
    [sheet show];
}

/// 切换登录方式的按钮点击
- (void)_changeLoginButtonDidClicked:(UIButton *)button {
    button.userInteractionEnabled = NO; /// 动画过程中 禁止交互
    button.selected = !button.isSelected;
    /// 赋值
    self.viewModel.selected = button.isSelected;
    CGFloat offsetX1 = button.isSelected ? YYR_SCREEN_WIDTH : 0;
    CGFloat offsetX2 = button.isSelected ? 0 : YYR_SCREEN_WIDTH;
    /// 做动画
    [self.mobileLoginView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountBaseView).with.offset(-1 *offsetX1);
    }];
    [self.accountLoginView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountBaseView).with.offset(-1 * offsetX2);
    }];
    [UIView animateWithDuration:.25 animations:^{
        /// animated
        [self.accountBaseView layoutIfNeeded];
    } completion:^(BOOL finished) {
        /// 重新设置
        [button.isSelected?self.mobileLoginView:self.accountLoginView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.accountBaseView.mas_left).with.offset(button.isSelected ? offsetX1 : offsetX2);
        }];
        
        button.userInteractionEnabled = YES; /// 动画完成 允许交互
    }];
}

#pragma mark - 初始化
- (void)_setup {
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.alwaysBounceVertical = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    /// 适配 iOS 11
    YYRAdjustsScrollViewInsets_Never(scrollView);
    [self.view addSubview:scrollView];
    
    // 1. 添加一个视图，四周和 scrollView 一致
    UIView *containerView = [[UIView alloc] init];
    containerView.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:containerView];
    self.containerView = containerView;
    
    /// 设置contentSize
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.equalTo(self.view);
        }
    }];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.mas_equalTo(YYR_SCREEN_WIDTH);
        make.height.mas_equalTo(YYR_SCREEN_HEIGHT);
    }];
}

/// 登录按钮
- (void)_loginButtonDidClicked:(UIButton *)button {
    /// 这里需要做验证
    if(self.changeloginButton.isSelected){ /// QQ登录
        if (![NSString yyr_isValidQQ:self.accountLoginView.accountTextField.text]
            || self.accountLoginView.passwordTextField.text.length < 8
            || self.accountLoginView.passwordTextField.text.length >16
            || [NSString yyr_isContainChinese:self.accountLoginView.passwordTextField.text] ) {
            [NSObject yyr_showAlertViewWithTitle:@"账号或密码错误，请重新填写。" message:nil confirmTitle:@"确定"];
            return;
        }
        [self.viewModel.loginCommand execute:@(self.changeloginButton.isSelected)];
    }else{ /// 手机号登录
        /// 手机号登录 将区号+手机号码 传递过去
//        YYRMobileLoginViewModel *viewModel = [[YYRMobileLoginViewModel alloc] initWithServices:self.viewModel.services params:@{YYRMobileLoginPhoneKey:self.viewModel.phone,YYRMobileLoginZoneCodeKey:self.viewModel.zoneCode}];
//        [self.viewModel.services pushViewModel:viewModel animated:YES];
    }
    
}

#pragma mark - 设置导航栏
- (void)_setupNavigationItem{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem yyr_systemItemWithTitle:nil titleColor:nil imageName:@"barbuttonicon_more_black_30x30" target:self selector:@selector(_moreItemDidClicked) textType:NO];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem yyr_systemItemWithTitle:nil titleColor:nil imageName:@"SystemTipBtnClose_26x26" target:nil selector:nil textType:NO];
    self.navigationItem.leftBarButtonItem.rac_command = self.viewModel.closeCommand;
}

#pragma mark - 设置子控件
- (void)_setupSubViews {
    
    UIView *accountBaseView = [[UIView alloc] init];
    
    [self.containerView addSubview:accountBaseView];
    self.accountBaseView = accountBaseView;
    
    UIButton *changeButton = [UIButton yyr_buttonWithTitle:@"用微信号/QQ号/邮箱登录" fontSize:18 textColor:YYRColorFromHexString(@"#576B95")];
    // 设置Button文字左对齐
    changeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [changeButton addTarget:self action:@selector(_changeLoginButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.containerView addSubview:changeButton];
    self.changeloginButton = changeButton;
    
    // 登录
    UIButton *loginButton = [UIButton yyr_buttonWithTitle:@"登录" fontSize:18 textColor:YYRColorFromHexString(@"#FFFFFF")];
    // 设置边界
    loginButton.borderWidth = 1;
    loginButton.borderColor = YYRColorFromHexString(@"#499932");
    loginButton.cornerRadius = 6;
    loginButton.masksToBounds = YES;
    /// 设置背景
    [loginButton setBackgroundImage:[UIImage yy_imageWithColor:YYRColorFromHexString(@"#51AA38")] forState:UIControlStateNormal];
    [loginButton setBackgroundImage:[UIImage yy_imageWithColor:[YYRColorFromHexString(@"#51AA38") colorWithAlphaComponent:.5f]] forState:UIControlStateHighlighted];
    [loginButton setBackgroundImage:[UIImage yy_imageWithColor:YYRColorFromHexString(@"#AFDDA7")] forState:UIControlStateDisabled];
    [loginButton addTarget:self action:@selector(_loginButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.containerView addSubview:loginButton];
    self.loginButton = loginButton;

    /// 账号登录
    YYRAccountLoginView *accountLoginView = [YYRAccountLoginView accoutLoginView];
    self.accountLoginView = accountLoginView;
    [self.accountBaseView addSubview:accountLoginView];
    
    /// 手机登录
    YYRMobileLoginView *mobileLoginView = [YYRMobileLoginView mobileLoginView];
    [mobileLoginView bindViewModel:self.viewModel];
    self.mobileLoginView = mobileLoginView;
    [self.accountBaseView addSubview:mobileLoginView];
    
    /// 布局
    CGFloat margin = 8.0;
    [self.accountBaseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.containerView);
        make.top.equalTo(self.containerView).offset(142);
        make.height.mas_equalTo(158);
    }];
    
    [self.changeloginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountBaseView.mas_bottom).offset(4 * margin);
        make.left.equalTo(self.containerView).offset(2.5 * margin);
        make.right.equalTo(self.containerView).offset(-2.5 * margin);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.changeloginButton.mas_bottom).offset(8.5 * margin);
        make.left.equalTo(self.containerView).offset(2.5 * margin);
        make.right.equalTo(self.containerView).offset(-2.5 * margin);
        make.height.mas_equalTo(5.5 * margin);
    }];
    
    [mobileLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountBaseView);
        make.top.and.bottom.equalTo(self.accountBaseView);
        make.width.equalTo(self.accountBaseView);
    }];
    
    [accountLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountBaseView).with.offset(YYR_SCREEN_WIDTH);
        make.top.and.bottom.equalTo(self.accountBaseView);
        make.width.equalTo(self.accountBaseView);
    }];
}


@end
