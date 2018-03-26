//
//  YYREmoticonGroup.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRObject.h"
#import "YYREmoticon.h"

@interface YYREmoticonGroup : YYRObject

@property (nonatomic, readwrite, copy) NSString *groupID; ///< 例如 com.sina.default
@property (nonatomic, readwrite, assign) NSInteger version;
@property (nonatomic, readwrite, copy) NSString *nameCN; ///< 例如 浪小花
@property (nonatomic, readwrite, copy) NSString *nameEN;
@property (nonatomic, readwrite, copy) NSString *nameTW;
@property (nonatomic, readwrite, assign) NSInteger displayOnly;
@property (nonatomic, readwrite, assign) NSInteger groupType;
@property (nonatomic, readwrite, copy) NSArray<YYREmoticon *> *emoticons;

@end
