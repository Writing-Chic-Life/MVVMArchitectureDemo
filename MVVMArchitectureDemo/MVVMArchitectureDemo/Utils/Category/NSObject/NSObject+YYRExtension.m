//
//  NSObject+YYRExtension.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "NSObject+YYRExtension.h"

@implementation NSObject (YYRExtension)

+ (NSInteger) yyr_randomNumberWithFrom:(NSInteger)from to:(NSInteger)to {
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}


- (void)yyr_convertNotification:(NSNotification *)notification completion:(void (^ _Nullable)(CGFloat, UIViewAnimationOptions, CGFloat))completion {
    // 按钮
    NSDictionary *userInfo = notification.userInfo;
    // 最终尺寸
    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 开始尺寸
    CGRect beginFrame = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    // 动画时间
    CGFloat duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    /// options
    UIViewAnimationOptions options = ([userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue] << 16 ) | UIViewAnimationOptionBeginFromCurrentState;
    
    /// keyboard height
    CGFloat keyboardH = 0;
    if (beginFrame.origin.y == [[UIScreen mainScreen] bounds].size.height){
        // up
        keyboardH = endFrame.size.height;
    }else if (endFrame.origin.y == [[UIScreen mainScreen] bounds].size.height) {
        // down
        keyboardH = 0;
    }else{
        // up
        keyboardH = endFrame.size.height;
    }
    /// 回调
    !completion?:completion(duration,options,keyboardH);
}



/// Get class
- (BOOL)yyr_isStringClass { return [self isKindOfClass:[NSString class]]; }
- (BOOL)yyr_isNumberClass { return [self isKindOfClass:[NSNumber class]]; }
- (BOOL)yyr_isArrayClass { return [self isKindOfClass:[NSArray class]]; }
- (BOOL)yyr_isDictionaryClass { return [self isKindOfClass:[NSDictionary class]]; }
- (BOOL)yyr_isStringOrNumberClass { return [self yyr_isStringClass] || [self yyr_isNumberClass]; }
- (BOOL)yyr_isNullOrNil { return !self || [self isKindOfClass:[NSNull class]]; }
- (BOOL)yyr_isExist {
    if (self.yyr_isNullOrNil) return NO;
    if (self.yyr_isStringClass) return (self.yyr_stringValueExtension.length>0);
    return YES;
}

/// Get value
- (NSString *)yyr_stringValueExtension{
    if ([self yyr_isStringClass]) return [(NSString *)self length]? (NSString *)self: @"";
    if ([self yyr_isNumberClass]) return [NSString stringWithFormat:@"%@", self];
    return @"";
}


@end
