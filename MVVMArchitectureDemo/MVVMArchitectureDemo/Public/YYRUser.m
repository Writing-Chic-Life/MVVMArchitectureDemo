//
//  YYRUser.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRUser.h"

@implementation YYRUser

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"screenName"         : @"screen_name",
             @"profileImageUrl"    : @"profile_image_url",
             @"avatarLarge"        : @"avatar_large"
             };
}


/// 实现
- (BOOL)isEqual:(YYRUser *)object {
    /// 重写比对规则
    if([object isKindOfClass:[self class]])
    {
        return [self.idstr isEqualToString:object.idstr];
    }
    return [super isEqual:object];
}


- (instancetype)init {
    self = [super init];
    if (self) {
        _coverImage = YYRImageNamed(@"Kris");
    }
    return self;
}

@end
