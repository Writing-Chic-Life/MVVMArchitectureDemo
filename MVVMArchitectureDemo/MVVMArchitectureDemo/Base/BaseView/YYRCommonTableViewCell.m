//
//  YYRCommonTableViewCell.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRCommonTableViewCell.h"
#import "YYRCommonArrowItemViewModel.h"
#import "YYRCommonAvatarItemViewModel.h"
#import "YYRCommonQRCodeItemViewModel.h"
#import "YYRCommonLabelItemViewModel.h"
#import "YYRCommonSwitchItemViewModel.h"

@interface YYRCommonTableViewCell ()
/// viewModel
@property (nonatomic, readwrite, strong) YYRCommonItemViewModel *viewModel;

/// 箭头
@property (nonatomic, readwrite, strong) UIImageView *rightArrow;
/// 开光
@property (nonatomic, readwrite, strong) UISwitch *rightSwitch;
/// 标签
@property (nonatomic, readwrite, strong) UILabel *rightLabel;
/// avatar 头像
@property (nonatomic, readwrite, weak) UIImageView *avatarView;
/// QrCode
@property (nonatomic, readwrite, weak) UIImageView *qrCodeView;

/// 三条分割线
@property (nonatomic, readwrite, weak) UIImageView *divider0;
@property (nonatomic, readwrite, weak) UIImageView *divider1;
@property (nonatomic, readwrite, weak) UIImageView *divider2;

/// 中间偏左 view
@property (nonatomic, readwrite, weak) UIImageView *centerLeftView;
/// 中间偏右 view
@property (nonatomic, readwrite, weak) UIImageView *centerRightView;
@end
@implementation YYRCommonTableViewCell

#pragma mark - 公共方法
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    return [self cellWithTableView:tableView style:UITableViewCellStyleValue1];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style {
    static NSString *ID = @"CommonCell";
    YYRCommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:ID];
    }
    return cell;
}

- (void)setIndexPath:(NSIndexPath *)indexPath rowsInSection:(NSInteger)rows {
    self.divider0.hidden = NO;
    self.divider1.hidden = NO;
    self.divider2.hidden = NO;
    if (rows == 1) {                      /// 一段
        self.divider1.hidden = YES;
    }else if(indexPath.row == 0) {        /// 首行
        self.divider2.hidden = YES;
    }else if(indexPath.row == rows-1) {   /// 末行
        self.divider1.hidden = YES;
        self.divider0.hidden = YES;
    }else{ /// 中间行
        self.divider1.hidden = NO;
        self.divider0.hidden = YES;
        self.divider2.hidden = YES;
    }
}


- (void)bindViewModel:(YYRCommonItemViewModel *)viewModel {
    self.viewModel = viewModel;
    
    self.avatarView.hidden = YES;
    self.qrCodeView.hidden = YES;
    
    self.selectionStyle = viewModel.selectionStyle;
    self.textLabel.text = viewModel.title;
    self.imageView.image = (YYRStringIsNotEmpty(viewModel.icon))?YYRImageNamed(viewModel.icon):nil;
    self.detailTextLabel.text = viewModel.subtitle;
    /// 设置全新
    if (YYRStringIsNotEmpty(viewModel.centerLeftViewName)) {
        self.centerLeftView.hidden = NO;
        self.centerLeftView.image = YYRImageNamed(viewModel.centerLeftViewName);
        self.centerLeftView.yyr_size = self.centerLeftView.image.size;
    }else{
        self.centerLeftView.hidden = YES;;
    }
    
    /// 设置锁
    if (YYRStringIsNotEmpty(viewModel.centerRightViewName)) {
        self.centerRightView.hidden = NO;
        self.centerRightView.image = YYRImageNamed(viewModel.centerRightViewName);
        self.centerRightView.yyr_size = self.centerRightView.image.size;
    }else{
        self.centerRightView.hidden = YES;;
    }
    
    if ([viewModel isKindOfClass:[YYRCommonArrowItemViewModel class]]) {  /// 纯带箭头
        self.accessoryView = self.rightArrow;
        if ([viewModel isKindOfClass:[YYRCommonAvatarItemViewModel class]]) { // 头像
            YYRCommonAvatarItemViewModel *avatarViewModel = (YYRCommonAvatarItemViewModel *)viewModel;
            self.avatarView.hidden = NO;
            [self.avatarView yy_setImageWithURL:[NSURL URLWithString:avatarViewModel.avatar] placeholder:YYRWebAvatarImagePlaceholder() options:YYRWebImageOptionAutomatic completion:NULL];
        }else if ([viewModel isKindOfClass:[YYRCommonQRCodeItemViewModel class]]){ // 二维码
            self.qrCodeView.hidden = NO;
        }
    }else if([viewModel isKindOfClass:[YYRCommonSwitchItemViewModel class]]){ /// 开关
        // 右边显示开关
        YYRCommonSwitchItemViewModel *switchViewModel = (YYRCommonSwitchItemViewModel *)viewModel;
        self.accessoryView = self.rightSwitch;
        self.rightSwitch.on = !switchViewModel.off;
    }else{
        self.accessoryView = nil;
    }
}
#pragma mark - 私有方法
- (void)awakeFromNib {
    [super awakeFromNib];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        // 初始化
        [self _setup];
        
        // 创建自控制器
        [self _setupSubViews];
        
        // 布局子控件
        [self _makeSubViewsConstraints];
    }
    return self;
}

#pragma mark - 初始化
- (void)_setup {
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.detailTextLabel.textColor = YYRColorFromHexString(@"#888888");
    self.detailTextLabel.numberOfLines = 0;
    self.textLabel.font = YYRRegularFont_17;
    self.detailTextLabel.font = YYRRegularFont_16;
}

#pragma mark - 创建自控制器
- (void)_setupSubViews {
    
    /// CoderMikeHe Fixed : 这里需要把divider添加到self，而不是self.contentView ,由于添加了 accessView，导致self.contentView的宽度<self的宽度
    // 分割线
    UIImageView *divider0 = [[UIImageView alloc] init];
    self.divider0 = divider0;
    [self addSubview:divider0];
    UIImageView *divider1 = [[UIImageView alloc] init];
    self.divider1 = divider1;
    [self addSubview:divider1];
    UIImageView *divider2 = [[UIImageView alloc] init];
    self.divider2 = divider2;
    [self addSubview:divider2];
    divider0.backgroundColor = divider1.backgroundColor = divider2.backgroundColor = YYR_MAIN_LINE_COLOR_1;
    
    /// 添加用户头像
    UIImageView *avatarView = [[UIImageView alloc] init];
    self.avatarView = avatarView;
    avatarView.hidden = YES;
    [self.contentView addSubview:avatarView];
    /// 设置圆角+线宽
    [avatarView zy_attachBorderWidth:1.0f color:YYRColorFromHexString(@"#BFBFBF")];
    [avatarView zy_cornerRadiusAdvance:6.0f rectCornerType:UIRectCornerAllCorners];
    
    /// 二维码照片
    UIImageView *qrCodeView = [[UIImageView alloc] initWithImage:YYRImageNamed(@"setting_myQR_18x18")];
    qrCodeView.hidden = YES;
    self.qrCodeView = qrCodeView;
    [self.contentView addSubview:qrCodeView];
    
    /// 中间偏左的图片
    UIImageView *centerLeftView = [[UIImageView alloc] init];
    centerLeftView.hidden = YES;
    self.centerLeftView = centerLeftView;
    [self.contentView addSubview:centerLeftView];
    
    /// 中间偏左的图片
    UIImageView *centerRightView = [[UIImageView alloc] init];
    centerRightView.hidden = YES;
    self.centerRightView = centerRightView;
    [self.contentView addSubview:centerRightView];
}



#pragma mark - 布局子控件
- (void)_makeSubViewsConstraints {
    
    
}

#pragma mark - 布局
- (void)layoutSubviews {
    [super layoutSubviews];
    /// 设置
    if ((fabs(self.textLabel.yyr_x - self.detailTextLabel.yyr_x) <=.1f)) {
        /// SubTitle
        self.textLabel.yyr_bottom = self.detailTextLabel.yyr_top;
    }else{
        self.textLabel.yyr_centerY = self.yyr_height * .5f;
    }
    
    
    self.divider0.frame = CGRectMake(0, 0, self.yyr_width, YYRGlobalBottomLineHeight);
    self.divider1.frame = CGRectMake(14, self.yyr_height-YYRGlobalBottomLineHeight, self.yyr_width-14, YYRGlobalBottomLineHeight);
    self.divider2.frame = CGRectMake(0, self.yyr_height-YYRGlobalBottomLineHeight, self.yyr_width, YYRGlobalBottomLineHeight);
    
    /// 设置头像
    self.avatarView.yyr_size = CGSizeMake(66, 66);
    self.avatarView.yyr_right = self.accessoryView.yyr_left - 7;
    self.avatarView.yyr_centerY = self.yyr_height * .5f;
    
    /// 设置二维码
    self.qrCodeView.yyr_right = self.accessoryView.yyr_left - 11;
    self.qrCodeView.yyr_centerY = self.yyr_height * .5f;
    
    /// 配置Artboard
    self.centerLeftView.yyr_left = self.textLabel.yyr_right + 14;
    self.centerLeftView.yyr_centerY = self.yyr_height * .5f;
    
    /// 配置
    self.centerRightView.yyr_right = self.detailTextLabel.yyr_left - 5;
    self.centerRightView.yyr_centerY = self.yyr_height * .5f;
}

#pragma mark - 事件处理
- (void)_switchValueDidiChanged:(UISwitch *)sender {
    YYRCommonSwitchItemViewModel *switchViewModel = (YYRCommonSwitchItemViewModel *)self.viewModel;
    switchViewModel.off = !sender.isOn;
}



#pragma mark - Setter Or Getter
- (UIImageView *)rightArrow {
    if (_rightArrow == nil) {
        _rightArrow = [[UIImageView alloc] initWithImage:YYRImageNamed(@"tableview_arrow_8x13")];
    }
    return _rightArrow;
}

- (UISwitch *)rightSwitch {
    if (_rightSwitch == nil) {
        _rightSwitch = [[UISwitch alloc] init];
        [_rightSwitch addTarget:self action:@selector(_switchValueDidiChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _rightSwitch;
}


@end
