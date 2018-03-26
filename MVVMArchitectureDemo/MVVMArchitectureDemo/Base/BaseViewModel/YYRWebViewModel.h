//
//  YYRWebViewModel.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//
//  所有含有`WKWebView`的视图的视图模型基类

#import "YYRViewModel.h"

@interface YYRWebViewModel : YYRViewModel

/// web url quest
@property (nonatomic, readwrite, copy) NSURLRequest *request;

/// 下拉刷新 defalut is NO
@property (nonatomic, readwrite, assign) BOOL shouldPullDownToRefresh;

/// 是否取消导航栏的title等于webView的title。默认是不取消，default is NO
@property (nonatomic, readwrite, assign) BOOL shouldDisableWebViewTitle;

/// 是否取消关闭按钮。默认是不取消，default is NO
@property (nonatomic, readwrite, assign) BOOL shouldDisableWebViewClose;


@end
