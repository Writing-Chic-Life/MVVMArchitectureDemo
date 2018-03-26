//
//  YYREmoticonManager.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYREmoticonGroup.h"

@interface YYREmoticonManager : NSObject

/// 表情图片的资源文件
+ (NSBundle *)emoticonBundle;
/// 表情正则表达式
+ (NSRegularExpression *)regexEmoticon;
/// 表情字典
+ (NSDictionary *)emoticonDic;
/// 表情组
+ (NSArray<YYREmoticonGroup *> *)emoticonGroups;
/// 朋友圈表情缓存
+ (YYMemoryCache *)imageCache;
/// 通过路径获取图片 (有缓存)
+ (UIImage *)imageWithPath:(NSString *)path;

@end
