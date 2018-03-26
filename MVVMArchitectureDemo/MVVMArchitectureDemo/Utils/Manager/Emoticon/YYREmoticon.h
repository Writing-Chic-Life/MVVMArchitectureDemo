//
//  YYREmoticon.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRObject.h"

@class YYREmoticonGroup;

/// 表情类型
typedef NS_ENUM(NSUInteger, YYREmoticonType) {
    YYREmoticonTypeImage = 0, ///< 图片表情
    YYREmoticonTypeEmoji = 1, ///< Emoji表情
};

@interface YYREmoticon : YYRObject

@property (nonatomic, readwrite, copy) NSString *chs;  ///< 例如 [吃惊]
@property (nonatomic, readwrite, copy) NSString *cht;  ///< 例如 [吃驚]
@property (nonatomic, readwrite, copy) NSString *gif;  ///< 例如 d_chijing.gif
@property (nonatomic, readwrite, copy) NSString *png;  ///< 例如 d_chijing.png
@property (nonatomic, readwrite, copy) NSString *code; ///< 例如 0x1f60d
@property (nonatomic, readwrite, assign) YYREmoticonType type;
@property (nonatomic, readwrite, weak) YYREmoticonGroup *group;

@end
