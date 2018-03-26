//
//  UIView+YYRFrame.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "UIView+YYRFrame.h"

@implementation UIView (YYRFrame)

- (void)setYyr_x:(CGFloat)yyr_x {
    CGRect frame = self.frame;
    frame.origin.x = yyr_x;
    self.frame = frame;
}
- (CGFloat)yyr_x {
    return self.frame.origin.x;
}


- (void)setYyr_y:(CGFloat)yyr_y {
    CGRect frame = self.frame;
    frame.origin.y = yyr_y;
    self.frame = frame;
}
- (CGFloat)yyr_y {
    return self.frame.origin.y;
}


- (void)setYyr_centerX:(CGFloat)yyr_centerX {
    CGPoint center = self.center;
    center.x = yyr_centerX;
    self.center = center;
}
- (CGFloat)yyr_centerX {
    return self.center.x;
}



- (void)setYyr_centerY:(CGFloat)yyr_centerY {
    CGPoint center = self.center;
    center.y = yyr_centerY;
    self.center = center;
}
- (CGFloat)yyr_centerY {
    return self.center.y;
}




- (void)setYyr_width:(CGFloat)yyr_width {
    CGRect frame = self.frame;
    frame.size.width = yyr_width;
    self.frame = frame;
}
- (CGFloat)yyr_width {
    return self.frame.size.width;
}


- (void)setYyr_height:(CGFloat)yyr_height {
    CGRect frame = self.frame;
    frame.size.height = yyr_height;
    self.frame = frame;
}
- (CGFloat)yyr_height {
    return self.frame.size.height;
}





- (void)setYyr_size:(CGSize)yyr_size {
    CGRect frame = self.frame;
    frame.size = yyr_size;
    self.frame = frame;
}
- (CGSize)yyr_size {
    return self.frame.size;
}





- (void)setYyr_origin:(CGPoint)yyr_origin {
    CGRect frame = self.frame;
    frame.origin = yyr_origin;
    self.frame = frame;
}
- (CGPoint)yyr_origin {
    return self.frame.origin;
}


- (void)setYyr_top:(CGFloat)yyr_top {
    CGRect frame = self.frame;
    frame.origin.y = yyr_top;
    self.frame = frame;
}
- (CGFloat)yyr_top {
    return self.frame.origin.y;
}


- (void)setYyr_left:(CGFloat)yyr_left {
    CGRect frame = self.frame;
    frame.origin.x = yyr_left;
    self.frame = frame;
}
- (CGFloat)yyr_left {
    return self.frame.origin.x;
}


- (void)setYyr_bottom:(CGFloat)yyr_bottom {
    CGRect frame = self.frame;
    frame.origin.y = yyr_bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)yyr_bottom {
    return self.frame.origin.y + self.frame.size.height;
}


- (void)setYyr_right:(CGFloat)yyr_right {
    CGRect frame = self.frame;
    frame.origin.x = yyr_right - frame.size.width;
    self.frame = frame;
}
- (CGFloat)yyr_right {
    return self.frame.origin.x + self.frame.size.width;
}


@end
