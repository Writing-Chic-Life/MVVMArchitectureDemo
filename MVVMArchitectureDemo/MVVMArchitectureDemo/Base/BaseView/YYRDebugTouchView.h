//
//  YYRDebugTouchView.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//
//  调试指示器 方便测试测试

#import <UIKit/UIKit.h>

@interface YYRDebugTouchView : UIImageView

/// init
YYRSingletonH(Instance);

/// 设置显示or隐藏
- (void)setHide:(BOOL)hide;
- (BOOL)isHide;

@end
