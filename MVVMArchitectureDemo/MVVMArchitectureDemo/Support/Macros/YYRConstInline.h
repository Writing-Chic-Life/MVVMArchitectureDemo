//
//  YYRConstInline.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#ifndef YYRConstInline_h
#define YYRConstInline_h

/// 网络图片的占位图片
static inline UIImage *YYRWebImagePlaceholder(){
    return [UIImage imageNamed:@"placeholder_image"];
}

/// 网络头像
static inline UIImage *YYRWebAvatarImagePlaceholder(){
    return [UIImage imageNamed:@"DefaultProfileHead_66x66"];
}

/// 适配
static inline CGFloat YYRPxConvertToPt(CGFloat px){
    return ceil(px * [UIScreen mainScreen].bounds.size.width/414.0f);
}


/// 辅助方法 创建一个文件夹
static inline void YYRCreateDirectoryAtPath(NSString *path){
    BOOL isDir = NO;
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
    if (isExist) {
        if (!isDir) {
            [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
            [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        }
    } else {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
}
/// 微信重要数据备份的文件夹路径，通过NSFileManager来访问
static inline NSString *YYRWeChatDocDirPath(){
    return [YYRDocumentDirectory stringByAppendingPathComponent:YYR_WECHAT_DOC_NAME];
}
/// 通过NSFileManager来获取指定重要数据的路径
static inline NSString *YYRFilePathFromWeChatDoc(NSString *filename){
    NSString *docPath = YYRWeChatDocDirPath();
    YYRCreateDirectoryAtPath(docPath);
    return [docPath stringByAppendingPathComponent:filename];
}

/// 微信轻量数据备份的文件夹路径，通过NSFileManager来访问
static inline NSString *YYRWeChatCacheDirPath(){
    return [YYRCachesDirectory stringByAppendingPathComponent:YYR_WECHAT_CACHE_NAME];
}
/// 通过NSFileManager来访问 获取指定轻量数据的路径
static inline NSString *YYRFilePathFromWeChatCache(NSString *filename){
    NSString *cachePath = YYRWeChatCacheDirPath();
    YYRCreateDirectoryAtPath(cachePath);
    return [cachePath stringByAppendingPathComponent:filename];
}




#endif /* YYRConstInline_h */
