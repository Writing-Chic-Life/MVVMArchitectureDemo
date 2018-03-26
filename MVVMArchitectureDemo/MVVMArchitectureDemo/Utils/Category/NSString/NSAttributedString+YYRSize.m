//
//  NSAttributedString+YYRSize.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "NSAttributedString+YYRSize.h"

@implementation NSAttributedString (YYRSize)

- (CGSize)yyr_sizeWithLimitSize:(CGSize)limitSize {
    CGSize theSize;
    CGRect rect = [self boundingRectWithSize:limitSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    theSize.width = ceil(rect.size.width);
    theSize.height = ceil(rect.size.height);
    return theSize;
}

- (CGSize)yyr_sizeWithLimitWidth:(CGFloat)limitWidth {
    return [self yyr_sizeWithLimitSize:CGSizeMake(limitWidth, MAXFLOAT)];
}

@end
