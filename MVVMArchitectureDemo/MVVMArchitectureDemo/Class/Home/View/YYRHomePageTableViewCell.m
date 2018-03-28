//
//  YYRHomePageTableViewCell.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/28.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRHomePageTableViewCell.h"
#import "YYRHomePageItemViewModel.h"

@interface YYRHomePageTableViewCell ()
/// viewModel
@property (nonatomic, readwrite, strong) YYRHomePageItemViewModel *viewModel;

/// topView
@property (weak, nonatomic) UIView *topView;
/// avatarView
@property (weak, nonatomic) UIImageView *avatarView;
/// nicknameLabel
@property (weak, nonatomic) UILabel *nicknameLabel;
/// locationBtn
@property (weak, nonatomic) UIButton *locationBtn;
/// starLevelView
@property (weak, nonatomic) UIImageView *starLevelView;
/// audienceNumsLabel
@property (weak, nonatomic) UILabel *audienceNumsLabel;
/// coverView
@property (weak, nonatomic) UIImageView *coverView;
/// headTipsBtn
@property (weak, nonatomic) UIButton *headTipsBtn;
/// signView
@property (weak, nonatomic) UIImageView *signView;
/// liveTypeImageView
@property (weak, nonatomic) UIImageView *liveTypeImageView;

@end
@implementation YYRHomePageTableViewCell



#pragma mark - Public Method
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"LiveRoomCell";
    YYRHomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)bindViewModel:(YYRHomePageItemViewModel *)viewModel {
    self.viewModel = viewModel;
    
    [self.avatarView yy_setImageWithURL:viewModel.liveRoom.smallpic placeholder:YYRImageNamed(@"header_default_100x100") options:YYRWebImageOptionAutomatic completion:nil];
    self.signView.hidden = !viewModel.liveRoom.isSign;
    
    self.nicknameLabel.text = viewModel.liveRoom.myname;
    self.starLevelView.image = YYRImageNamed(viewModel.girlStar);
    
    [self.locationBtn setTitle:viewModel.liveRoom.gps forState:UIControlStateNormal];
    self.audienceNumsLabel.attributedText = viewModel.allNumAttr;
    
    [self.headTipsBtn setTitle:viewModel.liveRoom.familyName forState:UIControlStateNormal];
    [self.coverView yy_setImageWithURL:viewModel.liveRoom.bigpic placeholder:YYRImageNamed(@"placeholder_head_100x100") options:YYRWebImageOptionAutomatic completion:nil];
}

#pragma mark - UI
- (void)initUI {
    [super initUI];
    
    UIView *topView = [[UIView alloc] init];
    [self.contentView addSubview:topView];
    self.topView = topView;
    
    UIImageView *avatarView = [[UIImageView alloc] init];
//    avatarView.image = YYRImageNamed(@"mb_flag_live_42x22");
    avatarView.borderWidth = 1;
    avatarView.borderColor = YYRColorFromHexString(@"0xF14F94");
    avatarView.masksToBounds = YES;
    avatarView.cornerRadius = 21;
    [self.topView addSubview:avatarView];
    self.avatarView = avatarView;
    
    UIImageView *signView = [[UIImageView alloc] init];
    signView.image = YYRImageNamed(@"head_signed_22x22");
    [self.topView addSubview:signView];
    self.signView = signView;
    
    UILabel *nicknameLabel = [UILabel yyr_labelWithText:@"YYR" fontSize:17];
    [self.topView addSubview:nicknameLabel];
    self.nicknameLabel = nicknameLabel;
    
    UIImageView *starLevelView = [[UIImageView alloc] init];
    starLevelView.image = YYRImageNamed(@"girl_star1_40x19");
    [self.topView addSubview:avatarView];
    self.starLevelView = starLevelView;
    
    UILabel *audienceNumsLabel = [UILabel yyr_labelWithText:@"YYR" fontSize:17 textColor:YYRColorFromHexString(@"0x999999")];
    [self.topView addSubview:audienceNumsLabel];
    self.audienceNumsLabel = audienceNumsLabel;
    
    UIButton *locationBtn = [UIButton yyr_buttonWithTitle:@"深圳市" fontSize:12 textColor:YYRColorFromHexString(@"0x999999")];
    [locationBtn setImage:YYRImageNamed(@"mb_home_location_8x8") forState:UIControlStateNormal];
    [self.topView addSubview:locationBtn];
    self.locationBtn = locationBtn;
    
    UIImageView *coverView = [[UIImageView alloc] init];
//    coverView.image = YYRImageNamed(@"mb_flag_live_42x22");
    [self.contentView addSubview:coverView];
    self.coverView = coverView;
    
    UIButton *headTipsBtn = [UIButton yyr_buttonWithTitle:@"帝豪" fontSize:12 textColor:YYRColorFromHexString(@"0x999999")];
    [headTipsBtn setBackgroundImage:YYRImageNamed(@"head_tips_113x45") forState:UIControlStateNormal];
    [self.coverView addSubview:headTipsBtn];
    self.headTipsBtn = headTipsBtn;
    
    UIImageView *liveTypeImageView = [[UIImageView alloc] init];
    liveTypeImageView.image = YYRImageNamed(@"mb_flag_live_42x22");
    [self.coverView addSubview:liveTypeImageView];
    self.liveTypeImageView = liveTypeImageView;
}

#pragma mark - 约束
- (void)initConstraint {
    [super initConstraint];
    
    CGFloat margin = 8.0;
    CGSize avatarSize = CGSizeMake(42, 42);
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(7 * margin);
    }];
    
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.topView);
        make.left.equalTo(self.topView).offset(margin);
        make.size.mas_equalTo(avatarSize);
    }];
    
    [self.signView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.avatarView);
    }];
    
    [self.nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView).offset(1.25 * margin);
        make.left.equalTo(self.avatarView.mas_right).offset(1.5 * margin);
    }];
    
    [self.starLevelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nicknameLabel);
        make.left.equalTo(self.nicknameLabel.mas_right).offset(1.25 * margin);
    }];
    
    [self.locationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nicknameLabel.mas_bottom);
        make.left.equalTo(self.nicknameLabel);
//        make.right.equalTo(self.topView).offset(-1.5 * margin);
    }];
    
    [self.audienceNumsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.topView);
        make.right.equalTo(self.topView).offset(-1.5 * margin);
    }];
    
    [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.top.equalTo(self.topView.mas_bottom);
    }];
    
    [self.headTipsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.coverView).offset(margin);
    }];
    
    [self.liveTypeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverView).offset(1.5 * margin);
        make.right.equalTo(self.coverView).offset(-1.5 * margin);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
