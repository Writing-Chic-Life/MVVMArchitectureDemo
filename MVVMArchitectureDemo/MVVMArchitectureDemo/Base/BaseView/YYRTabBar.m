//
//  YYRTabBar.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRTabBar.h"

@interface YYRTabBar()

/// divider
@property (nonatomic, readwrite, weak) UIView *divider ;

@end
@implementation YYRTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        /// 去掉tabBar的分割线,以及背景图片
        [self setShadowImage:[UIImage new]];
        [self setBackgroundImage:[UIImage yyr_resizableImage:@"tabbarBkg_5x49"]];
        
        /// 添加细线,
        UIView *divider = [[UIView alloc] init];
        divider.backgroundColor = YYRColor(167.0f, 167.0f, 170.0f);
        [self addSubview:divider];
        self.divider = divider;
    }
    return self;
}


#pragma mark - 布局
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self bringSubviewToFront:self.divider];
    self.divider.yyr_height = YYRGlobalBottomLineHeight;
    self.divider.yyr_width = YYR_SCREEN_WIDTH;
}

@end
