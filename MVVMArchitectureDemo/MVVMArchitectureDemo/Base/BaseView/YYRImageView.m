//
//  YYRImageView.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRImageView.h"

@implementation YYRImageView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.userInteractionEnabled = YES;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

@end
