//
//  YYRMobileLoginView.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/4/3.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRMobileLoginView.h"
#import "YYRLoginViewModel.h"

@interface YYRMobileLoginView ()

/// zoneNameBtn
@property (weak, nonatomic) UIButton *zoneNameButton;
/// viewModel
@property (nonatomic, readwrite, strong) YYRLoginViewModel *viewModel;

/// zoneView
@property (strong, nonatomic) UIView *zoneView;
/// phoneView
@property (strong, nonatomic) UIView *phoneView;
@end
@implementation YYRMobileLoginView

+ (instancetype)mobileLoginView {
    return [[YYRMobileLoginView alloc] init];
}


#pragma mark - Public Method
- (void)bindViewModel:(id)viewModel {
    self.viewModel = viewModel;
}

- (void)setZoneName:(NSString *)zoneName {
    _zoneName = zoneName;
    [self.zoneNameButton setTitle:zoneName forState:UIControlStateNormal];
}

- (void)initUI {
    [super initUI];
    
    UILabel *titleLabel = [UILabel yyr_labelWithText:@"手机号登录" fontSize:25 textColor:[UIColor darkGrayColor]];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    [self addSubview:self.zoneView];
    
    [self addSubview:self.phoneView];
    
    /// 限制电话号码位数 13 （两个空格）
    [self.phoneTextField yyr_limitMaxLength:13];
    /// 限制区域编码 4
    [self.zoneCodeTextField yyr_limitMaxLength:4];
    
    /// 添加左侧 leftView
    UILabel *leftView = [UILabel yyr_labelWithText:@"+" font:YYRMediumFont(17.0f) textColor:[UIColor blackColor]];
    [leftView sizeToFit];
    self.zoneCodeTextField.leftView = leftView;
    self.zoneCodeTextField.leftViewMode = UITextFieldViewModeAlways;
    self.zoneCodeTextField.text = @"86";
    
    /// 事件处理
    @weakify(self);
    [[self.zoneNameButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(UIButton *sender) {
         @strongify(self);
         [self.viewModel.selelctZoneComand execute:nil];
     }];
}

- (void)initConstraint {
    [super initConstraint];
    
    CGFloat margin = 8.0;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self).offset(2.5 * margin);
        make.right.equalTo(self).offset(-2.5 * margin);
    }];
    
    [self.zoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(5.5 * margin);
    }];
    
    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.zoneView.mas_bottom);
        make.left.bottom.right.equalTo(self);
        make.height.mas_equalTo(5.5 * margin);
    }];
}

#pragma mark - 懒加载视图
- (UIView *)zoneView {
    if (!_zoneView) {
        _zoneView = [[UIView alloc] init];
        UILabel *zoneLabel = [UILabel yyr_labelWithText:@"国家/地区" fontSize:17];
        // 设置拉伸难易度
        [zoneLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        [_zoneView addSubview:zoneLabel];
        
        UIButton *zoneNameBtn = [UIButton yyr_buttonWithTitle:self.zoneName ? self.zoneName :@"中国" fontSize:17 textColor:YYRColorFromHexString(@"#000000")];
        // 设置Button文字左对齐
        zoneNameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 设置拉伸难易度
        [zoneNameBtn setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        [_zoneView addSubview:zoneNameBtn];
        self.zoneNameButton = zoneNameBtn;
    
        UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TableViewArrow_15x15"]];
        // 设置拉伸难易度
        [arrowImageView setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        [_zoneView addSubview:arrowImageView];
        
        UIView *dividerView = [[UIView alloc] init];
        dividerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_zoneView addSubview:dividerView];
        
        CGFloat margin = 8.0;
        [zoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_zoneView).offset(2.5 * margin);
            make.centerY.equalTo(_zoneView);
        }];
        [zoneNameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(zoneLabel.mas_right).offset(2 * margin);
            make.centerY.equalTo(_zoneView);
        }];
        [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_zoneView).offset(-2.5 * margin);
            make.centerY.equalTo(_zoneView);
            make.left.equalTo(zoneNameBtn.mas_right).offset(margin).priority(999);
        }];
        [dividerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_zoneView).offset(2.5 * margin);
            make.right.equalTo(_zoneView).offset(-2.5 * margin);
            make.bottom.equalTo(_zoneView);
            make.height.mas_equalTo(0.5);
        }];
    }
    return _zoneView;
}

- (UIView *)phoneView {
    if (!_phoneView) {
        _phoneView = [[UIView alloc] init];
        UITextField *zoneCodeTextField = [[UITextField alloc] init];
        [_phoneView addSubview:zoneCodeTextField];
        self.zoneCodeTextField = zoneCodeTextField;
        
        UIView *vDividerView = [[UIView alloc] init];
        vDividerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_phoneView addSubview:vDividerView];
        
        UITextField *phoneTextField = [[UITextField alloc] init];
        phoneTextField.textAlignment = NSTextAlignmentLeft;
        phoneTextField.placeholder = @"请输入手机号码";
        [_phoneView addSubview:phoneTextField];
        self.phoneTextField = phoneTextField;
        
        UIView *dividerView = [[UIView alloc] init];
        dividerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_phoneView addSubview:dividerView];
        
        CGFloat margin = 8.0;
        [zoneCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_phoneView).offset(2.5 * margin);
            make.centerY.equalTo(_phoneView);
            make.width.mas_equalTo(10.5 * margin);
            make.bottom.equalTo(dividerView.mas_top);
        }];
        [vDividerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_phoneView);
            make.left.equalTo(zoneCodeTextField.mas_right);
            make.width.mas_equalTo(0.5);
            make.bottom.equalTo(dividerView.mas_top);
        }];
        [phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vDividerView.mas_right);
            make.right.equalTo(_phoneView).offset(-2.5 * margin);
            make.top.equalTo(_phoneView);
            make.bottom.equalTo(dividerView.mas_top);
        }];
        [dividerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_phoneView).offset(2.5 * margin);
            make.right.equalTo(_phoneView).offset(-2.5 * margin);
            make.bottom.equalTo(_phoneView);
            make.height.mas_equalTo(0.5);
        }];
    }
    return _phoneView;
}

@end
