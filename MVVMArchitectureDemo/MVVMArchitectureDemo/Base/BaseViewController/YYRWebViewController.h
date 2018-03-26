//
//  YYRWebViewController.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//
//  所有需要显示WKWebView的自定义视图控制器的基类

#import "YYRViewController.h"
#import "YYRWebViewModel.h"
#import <WebKit/WebKit.h>

@interface YYRWebViewController : YYRViewController<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>

/// webView
@property (nonatomic, weak, readonly) WKWebView *webView;
/// 内容缩进 (64,0,0,0)
@property (nonatomic, readonly, assign) UIEdgeInsets contentInset;

@end
