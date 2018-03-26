//
//  YYRControl.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYGestureRecognizer.h"

@interface YYRControl : UIView

/// 图片
@property (nonatomic, readwrite , strong) UIImage *image;

/// 点击回调
@property (nonatomic, readwrite, copy) void (^touchBlock)(YYRControl *view, YYGestureRecognizerState state, NSSet *touches, UIEvent *event);
/// 长按回调
@property (nonatomic, readwrite, copy) void (^longPressBlock)(YYRControl *view, CGPoint point);

@end
