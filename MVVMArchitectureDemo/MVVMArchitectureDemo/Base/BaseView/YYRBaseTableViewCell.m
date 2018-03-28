//
//  YYRBaseTableViewCell.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/28.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRBaseTableViewCell.h"

@implementation YYRBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self initUI];
    [self initConstraint];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self initUI];
        [self initConstraint];
    }
    return self;
}

- (void)initUI {
    
    [self setBackgroundColor:[UIColor whiteColor]];
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
}

- (void)initConstraint {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
