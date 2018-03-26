//
//  UIView+YYRFrame.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YYRFrame)

/// < Shortcut for frame.origin.x.
@property (nonatomic, readwrite, assign) CGFloat yyr_left;
/// < Shortcut for frame.origin.y
@property (nonatomic, readwrite, assign) CGFloat yyr_top;
/// < Shortcut for frame.origin.x + frame.size.width
@property (nonatomic, readwrite, assign) CGFloat yyr_right;
/// < Shortcut for frame.origin.y + frame.size.height
@property (nonatomic, readwrite, assign) CGFloat yyr_bottom;

/// < Shortcut for frame.origin.x.
@property (nonatomic, readwrite, assign) CGFloat yyr_x;
/// < Shortcut for frame.origin.y
@property (nonatomic, readwrite, assign) CGFloat yyr_y;
/// < Shortcut for frame.size.width
@property (nonatomic, readwrite, assign) CGFloat yyr_width;
/// < Shortcut for frame.size.height
@property (nonatomic, readwrite, assign) CGFloat yyr_height;

/// < Shortcut for center.x
@property (nonatomic, readwrite, assign) CGFloat yyr_centerX;
///< Shortcut for center.y
@property (nonatomic, readwrite, assign) CGFloat yyr_centerY;

/// < Shortcut for frame.size.
@property (nonatomic, readwrite, assign) CGSize yyr_size;
/// < Shortcut for frame.origin.
@property (nonatomic, readwrite, assign) CGPoint yyr_origin;

@end
