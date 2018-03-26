//
//  UIImage+YYRExtension.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YYRExtension)

/**
 *  根据图片名返回一张能够自由拉伸的图片 (从中间拉伸)
 */
+ (UIImage *_Nullable)yyr_resizableImage:(NSString *_Nullable)imgName;
+ (UIImage *_Nullable)yyr_resizableImage:(NSString *_Nullable)imgName capInsets:(UIEdgeInsets)capInsets;


/// 返回一张未被渲染的图片
+ (UIImage *_Nullable)yyr_imageAlwaysShowOriginalImageWithImageName:(NSString *_Nullable)imageName;
/// 获取视频某个时间的帧图片
+ (UIImage *_Nullable)yyr_thumbnailImageForVideo:(NSURL *_Nullable)videoURL atTime:(NSTimeInterval)time;

/// /// 获取屏幕截图
///
/// @return 屏幕截图图像
+ (UIImage *_Nullable)yyr_screenShot;

/**
 生成指定颜色的一个`点`的图像
 
 @param color 颜色
 @return 1 * 1 图像
 */
+ (nonnull UIImage *)yyr_singleDotImageWithColor:(nonnull UIColor *)color;

@end
