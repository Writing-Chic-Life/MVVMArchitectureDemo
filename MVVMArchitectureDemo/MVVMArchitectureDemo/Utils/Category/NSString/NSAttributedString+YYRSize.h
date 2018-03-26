//
//  NSAttributedString+YYRSize.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (YYRSize)

/**
 *  动态计算文字的宽高（多行）
 *  @param limitSize 限制的范围
 *
 *  @return 计算的宽高
 */
- (CGSize)yyr_sizeWithLimitSize:(CGSize)limitSize;

/**
 *  动态计算文字的宽高（多行）
 *  @param limitWidth 限制宽度 ，高度不限制
 *
 *  @return 计算的宽高
 */
- (CGSize)yyr_sizeWithLimitWidth:(CGFloat)limitWidth;

@end
