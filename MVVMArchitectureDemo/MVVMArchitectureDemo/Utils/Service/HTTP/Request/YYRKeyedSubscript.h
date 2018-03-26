//
//  YYRKeyedSubscript.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//  参数

#import <Foundation/Foundation.h>

@interface YYRKeyedSubscript : NSObject

// 类方法
+ (instancetype) subscript;

/// 拼接一个字典
+ (instancetype)subscriptWithDictionary:(NSDictionary *)dict;

-(instancetype)initWithDictionary:(NSDictionary *)dict;

- (id)objectForKeyedSubscript:(id)key;

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;

/// 转换为字典
- (NSDictionary *)dictionary;

@end
